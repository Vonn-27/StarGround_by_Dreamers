const msgerForm = document.getElementById("msgerInputArea");
const msgerInput = document.getElementById("userInput");
const msgerChat = document.getElementById("chatboxMessages");

const BOT_IMG = "gambar/logo.png";
const PERSON_IMG = "gambar/login.png";
const BOT_NAME = "Straground";
const PERSON_NAME = "You";

// Initial system message, not displayed in chatbox
const initialSystemMessage = {
  role: "system",
  content: "Kamu seorang ahli PUBG Mobile, gunakan bahasa Indonesia, dan gunakan bahasa yang mudah dipahami, ringkas."
};

let conversationHistory = [initialSystemMessage];

// Function to add message to chatbox
function appendMessage(name, img, side, text) {
  const msgHTML = `
    <div class="msg ${side}-msg">
      <div class="msg-img" style="background-image: url(${img})"></div>
      <div class="msg-bubble">
        <div class="msg-info">
          <div class="msg-info-name">${name}</div>
          <div class="msg-info-time">${formatDate(new Date())}</div>
        </div>
        <div class="msg-text">${text}</div>
      </div>
    </div>
  `;
  msgerChat.insertAdjacentHTML("beforeend", msgHTML);
  msgerChat.scrollTop += 500;
}

msgerForm.addEventListener("submit", event => {
  event.preventDefault();
  const msgText = msgerInput.value;
  if (!msgText) return;

  appendMessage(PERSON_NAME, PERSON_IMG, "right", msgText);
  conversationHistory.push({ role: "user", content: msgText });

  msgerInput.value = "";
  sendToGroqAI();
});

// Function to format bot's response
function formatBotResponse(text) {
  return text
    .replace(/\*\*(.*?)\*\*/g, '<b>$1</b>') // Bold
    .replace(/\*(.*?)\*/g, '<i>$1</i>')    // Italic
    .replace(/\n/g, '<br>')               // Line breaks
    .replace(/- (.*?)(?=\n|$)/g, '<ul><li>$1</li></ul>'); // Bullet points
}

async function sendToGroqAI() {
  try {
    const response = await fetch('http://localhost:3000/chat', {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json'
      },
      body: JSON.stringify({ messages: conversationHistory }),
    });

    if (!response.ok) {
      throw new Error(`Network response was not ok: ${response.statusText}`);
    }

    const data = await response.json();
    const botMessageContent = data.content;

    let formattedContent;
    if (botMessageContent.startsWith('FETCH:')) {
      const fetchedData = JSON.parse(botMessageContent.substring(6));
      formattedContent = formatBotResponse(JSON.stringify(fetchedData));
      conversationHistory.push({ role: "assistant", content: JSON.stringify(fetchedData) });
    } else {
      formattedContent = formatBotResponse(botMessageContent);
      conversationHistory.push({ role: "assistant", content: botMessageContent });
    }

    appendMessage(BOT_NAME, BOT_IMG, "left", formattedContent);
  } catch (error) {
    console.error('Error:', error);
    appendMessage(BOT_NAME, BOT_IMG, "left", 'Sorry, something went wrong. Please try again later.');
  }
}

// Function to load conversation history into chatbox on page load
function loadMessagesToChatbox() {
  conversationHistory.slice(1).forEach(message => { // Skip the system message
    const side = message.role === 'user' ? 'right' : 'left';
    const name = message.role === 'user' ? PERSON_NAME : BOT_NAME;
    const img = message.role === 'user' ? PERSON_IMG : BOT_IMG;
    appendMessage(name, img, side, formatBotResponse(message.content));
  });
}

// Utility function to format date
function formatDate(date) {
  const h = "0" + date.getHours();
  const m = "0" + date.getMinutes();
  return `${h.slice(-2)}:${m.slice(-2)}`;
}

// Load messages into chatbox on page load
window.onload = loadMessagesToChatbox;
