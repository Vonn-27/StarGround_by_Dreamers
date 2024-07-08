const initialSystemMessage = {
  role: "system",
  content: "Kamu seorang ahli PUBG Mobile, kamu bertugas untuk memberikan solusi pada user, gunakan bahasa Indonesia."
};

let conversationHistory = loadConversationHistory();

function loadConversationHistory() {
  const savedHistory = localStorage.getItem('conversationHistory');
  if (savedHistory) {
    return JSON.parse(savedHistory);
  } else {
    return [initialSystemMessage];
  }
}

function saveConversationHistory(history) {
  localStorage.setItem('conversationHistory', JSON.stringify(history));
}

function resetConversationHistory() {
  conversationHistory = [initialSystemMessage];
  saveConversationHistory(conversationHistory);
}

// Function to format bot's response
function formatBotResponse(text) {
  return text
    .replace(/\*\*(.*?)\*\*/g, '<b>$1</b>') // Bold
    .replace(/\*(.*?)\*/g, '<i>$1</i>')    // Italic
    .replace(/\n/g, '<br>')               // Line breaks
    .replace(/- (.*?)(?=\n|$)/g, '<li>$1</li>') // Bullet points
    .replace(/(<li>.*?<\/li>)/g, '<ul>$1</ul>') // Wrap in <ul> tags
    .replace(/<\/ul><ul>/g, ''); // Remove consecutive <ul> tags
}




async function sendMessage() {
  const userInput = document.getElementById('userInput').value;
  if (!userInput) {
    return;
  }

  const contentSection = document.querySelector('.content');

  conversationHistory.push({ role: "user", content: userInput });
  saveConversationHistory(conversationHistory);

  try {
    const response = await fetch('http://localhost:3000/chat', {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json'
      },
      body: JSON.stringify({ messages: conversationHistory })
    });

    if (!response.ok) {
      throw new Error(`Network response was not ok: ${response.statusText}`);
    }

    const data = await response.json();

    const botMessageContent = Array.isArray(data.content) ? JSON.stringify(data.content) : data.content || "Maaf, saya tidak dapat memahami itu.";
    const formattedBotMessage = formatBotResponse(botMessageContent);

    conversationHistory.push({ role: "assistant", content: botMessageContent });
    saveConversationHistory(conversationHistory);

    contentSection.innerHTML = `<p>${formattedBotMessage}</p>`;

  } catch (error) {
    console.error('Error:', error);
    contentSection.innerHTML = '<p>Bot: Maaf, terjadi kesalahan. Silakan coba lagi nanti.</p>';
  }

  document.getElementById('userInput').value = '';
}

document.getElementById('userInput').addEventListener('keydown', function(event) {
  if (event.key === 'Enter') {
    sendMessage();
  }
});

window.onload = function() {
  resetConversationHistory();
};
