const highlightActiveChat = () => {
  const chats = document.querySelectorAll('.chat-listing');
  chats.forEach (chat => {
    if (document.getElementById('chatroom').getAttribute('data-action') == chat.getAttribute('data-id')) {
      chat.classList.add('highlight');
    }
  });
};

export default highlightActiveChat;