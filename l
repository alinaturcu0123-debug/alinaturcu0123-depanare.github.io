<!DOCTYPE html>
<html lang="ro">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>Bubu Stories ✨</title>
  <link href="https://fonts.googleapis.com/css2?family=Bubblegum+Sans&family=Nunito:wght@400;600;700&display=swap" rel="stylesheet"/>
  <style>
    :root {
      --mint: #a8edcf;
      --coral: #ff7f7f;
      --sun: #ffd166;
      --sky: #74c7f0;
      --lilac: #c9a8f5;
      --peach: #ffb997;
      --bg: #fff9f0;
      --dark: #2d2440;
    }

    * { margin: 0; padding: 0; box-sizing: border-box; }

    body {
      font-family: 'Nunito', sans-serif;
      background: var(--bg);
      color: var(--dark);
      min-height: 100vh;
      overflow-x: hidden;
    }

    /* Floating blobs background */
    body::before {
      content: '';
      position: fixed;
      inset: 0;
      background:
        radial-gradient(circle at 10% 20%, rgba(168,237,207,0.35) 0%, transparent 40%),
        radial-gradient(circle at 90% 10%, rgba(201,168,245,0.3) 0%, transparent 40%),
        radial-gradient(circle at 80% 80%, rgba(255,209,102,0.3) 0%, transparent 40%),
        radial-gradient(circle at 20% 85%, rgba(116,199,240,0.3) 0%, transparent 40%);
      z-index: -1;
      pointer-events: none;
    }

    /* ---- HEADER ---- */
    header {
      text-align: center;
      padding: 60px 20px 30px;
      position: relative;
    }

    .logo-wrap {
      display: inline-block;
      position: relative;
    }

    .logo-bear {
      font-size: 72px;
      display: block;
      animation: float 3s ease-in-out infinite;
      filter: drop-shadow(0 8px 16px rgba(0,0,0,0.12));
    }

    @keyframes float {
      0%, 100% { transform: translateY(0px) rotate(-3deg); }
      50% { transform: translateY(-12px) rotate(3deg); }
    }

    h1 {
      font-family: 'Bubblegum Sans', cursive;
      font-size: clamp(2.5rem, 8vw, 5rem);
      background: linear-gradient(135deg, var(--coral), var(--lilac), var(--sky));
      -webkit-background-clip: text;
      -webkit-text-fill-color: transparent;
      background-clip: text;
      line-height: 1.1;
      margin-top: 10px;
      letter-spacing: 1px;
    }

    .tagline {
      font-size: 1.1rem;
      color: #888;
      margin-top: 10px;
      font-weight: 600;
    }

    /* Stars decoration */
    .stars {
      display: flex;
      justify-content: center;
      gap: 8px;
      margin-top: 16px;
      font-size: 1.4rem;
    }
    .stars span { animation: twinkle 2s ease-in-out infinite; }
    .stars span:nth-child(2) { animation-delay: 0.4s; }
    .stars span:nth-child(3) { animation-delay: 0.8s; }
    .stars span:nth-child(4) { animation-delay: 1.2s; }
    .stars span:nth-child(5) { animation-delay: 1.6s; }
    @keyframes twinkle {
      0%, 100% { transform: scale(1); opacity: 1; }
      50% { transform: scale(1.3); opacity: 0.7; }
    }

    /* ---- ADD STORY BUTTON ---- */
    .add-btn-wrap {
      display: flex;
      justify-content: center;
      margin: 30px 0 10px;
    }

    .add-btn {
      background: linear-gradient(135deg, var(--coral), var(--peach));
      color: white;
      border: none;
      padding: 14px 36px;
      border-radius: 50px;
      font-family: 'Bubblegum Sans', cursive;
      font-size: 1.2rem;
      cursor: pointer;
      box-shadow: 0 6px 20px rgba(255,127,127,0.4);
      transition: transform 0.2s, box-shadow 0.2s;
      letter-spacing: 0.5px;
    }
    .add-btn:hover {
      transform: translateY(-3px) scale(1.04);
      box-shadow: 0 10px 28px rgba(255,127,127,0.5);
    }
    .add-btn:active { transform: scale(0.97); }

    /* ---- MODAL ---- */
    .modal-overlay {
      display: none;
      position: fixed;
      inset: 0;
      background: rgba(45,36,64,0.45);
      backdrop-filter: blur(4px);
      z-index: 100;
      align-items: center;
      justify-content: center;
      padding: 20px;
    }
    .modal-overlay.open { display: flex; }

    .modal {
      background: white;
      border-radius: 28px;
      padding: 36px;
      width: 100%;
      max-width: 520px;
      box-shadow: 0 20px 60px rgba(0,0,0,0.18);
      animation: popIn 0.3s cubic-bezier(0.34,1.56,0.64,1);
    }
    @keyframes popIn {
      from { transform: scale(0.8); opacity: 0; }
      to { transform: scale(1); opacity: 1; }
    }

    .modal h2 {
      font-family: 'Bubblegum Sans', cursive;
      font-size: 1.8rem;
      color: var(--dark);
      margin-bottom: 20px;
      text-align: center;
    }

    .modal label {
      display: block;
      font-weight: 700;
      margin-bottom: 6px;
      color: #555;
    }

    .modal input, .modal textarea, .modal select {
      width: 100%;
      border: 2.5px solid #e8e0f5;
      border-radius: 14px;
      padding: 12px 16px;
      font-family: 'Nunito', sans-serif;
      font-size: 1rem;
      margin-bottom: 16px;
      transition: border-color 0.2s;
      background: #fafafa;
    }
    .modal input:focus, .modal textarea:focus {
      outline: none;
      border-color: var(--lilac);
      background: white;
    }
    .modal textarea { min-height: 130px; resize: vertical; }

    .modal-actions {
      display: flex;
      gap: 12px;
      margin-top: 4px;
    }
    .btn-save {
      flex: 1;
      background: linear-gradient(135deg, var(--lilac), var(--sky));
      color: white;
      border: none;
      padding: 13px;
      border-radius: 14px;
      font-family: 'Bubblegum Sans', cursive;
      font-size: 1.1rem;
      cursor: pointer;
      transition: transform 0.2s, box-shadow 0.2s;
      box-shadow: 0 4px 14px rgba(201,168,245,0.4);
    }
    .btn-save:hover { transform: translateY(-2px); box-shadow: 0 8px 20px rgba(201,168,245,0.5); }
    .btn-cancel {
      padding: 13px 20px;
      border: 2.5px solid #e8e0f5;
      background: white;
      border-radius: 14px;
      font-family: 'Nunito', sans-serif;
      font-weight: 700;
      cursor: pointer;
      color: #999;
      transition: border-color 0.2s;
    }
    .btn-cancel:hover { border-color: var(--coral); color: var(--coral); }

    /* ---- STORY CARDS GRID ---- */
    .grid {
      display: grid;
      grid-template-columns: repeat(auto-fill, minmax(280px, 1fr));
      gap: 24px;
      padding: 20px 30px 60px;
      max-width: 1100px;
      margin: 0 auto;
    }

    .card {
      background: white;
      border-radius: 24px;
      overflow: hidden;
      box-shadow: 0 4px 20px rgba(0,0,0,0.07);
      cursor: pointer;
      transition: transform 0.25s, box-shadow 0.25s;
      animation: cardIn 0.5s ease both;
      position: relative;
    }
    .card:hover {
      transform: translateY(-6px) rotate(0.5deg);
      box-shadow: 0 14px 40px rgba(0,0,0,0.13);
    }
    @keyframes cardIn {
      from { opacity: 0; transform: translateY(20px); }
      to { opacity: 1; transform: translateY(0); }
    }

    .card-banner {
      height: 110px;
      display: flex;
      align-items: center;
      justify-content: center;
      font-size: 52px;
      position: relative;
      overflow: hidden;
    }
    .card-banner::after {
      content: '';
      position: absolute;
      inset: 0;
      background: rgba(255,255,255,0.15);
    }

    .card-body { padding: 18px 20px 22px; }

    .card-title {
      font-family: 'Bubblegum Sans', cursive;
      font-size: 1.25rem;
      color: var(--dark);
      margin-bottom: 6px;
    }

    .card-preview {
      font-size: 0.88rem;
      color: #999;
      line-height: 1.5;
      display: -webkit-box;
      -webkit-line-clamp: 2;
      -webkit-box-orient: vertical;
      overflow: hidden;
    }

    .card-footer {
      display: flex;
      align-items: center;
      justify-content: space-between;
      margin-top: 14px;
    }

    .card-date {
      font-size: 0.78rem;
      color: #ccc;
      font-weight: 600;
    }

    .card-delete {
      background: none;
      border: none;
      font-size: 1.1rem;
      cursor: pointer;
      opacity: 0.4;
      transition: opacity 0.2s, transform 0.2s;
      padding: 4px 6px;
    }
    .card-delete:hover { opacity: 1; transform: scale(1.2); }

    /* ---- READER MODAL ---- */
    .reader-overlay {
      display: none;
      position: fixed;
      inset: 0;
      background: rgba(45,36,64,0.5);
      backdrop-filter: blur(6px);
      z-index: 200;
      align-items: center;
      justify-content: center;
      padding: 20px;
    }
    .reader-overlay.open { display: flex; }

    .reader {
      background: white;
      border-radius: 28px;
      padding: 40px;
      width: 100%;
      max-width: 600px;
      max-height: 85vh;
      overflow-y: auto;
      box-shadow: 0 24px 70px rgba(0,0,0,0.2);
      animation: popIn 0.3s cubic-bezier(0.34,1.56,0.64,1);
      position: relative;
    }

    .reader-emoji {
      text-align: center;
      font-size: 60px;
      margin-bottom: 16px;
    }

    .reader-title {
      font-family: 'Bubblegum Sans', cursive;
      font-size: 2rem;
      text-align: center;
      color: var(--dark);
      margin-bottom: 20px;
    }

    .reader-divider {
      height: 3px;
      background: linear-gradient(90deg, var(--coral), var(--lilac), var(--sky));
      border-radius: 10px;
      margin-bottom: 24px;
    }

    .reader-text {
      font-size: 1.05rem;
      line-height: 1.85;
      color: #444;
      white-space: pre-wrap;
    }

    .reader-close {
      position: absolute;
      top: 18px;
      right: 22px;
      background: #f0eef8;
      border: none;
      border-radius: 50%;
      width: 36px;
      height: 36px;
      font-size: 1rem;
      cursor: pointer;
      display: flex;
      align-items: center;
      justify-content: center;
      transition: background 0.2s, transform 0.2s;
    }
    .reader-close:hover { background: var(--coral); color: white; transform: rotate(90deg); }

    /* ---- EMPTY STATE ---- */
    .empty {
      text-align: center;
      padding: 60px 20px;
      animation: cardIn 0.5s ease both;
    }
    .empty-emoji { font-size: 64px; margin-bottom: 16px; }
    .empty h3 {
      font-family: 'Bubblegum Sans', cursive;
      font-size: 1.6rem;
      color: var(--dark);
      margin-bottom: 8px;
    }
    .empty p { color: #aaa; font-size: 1rem; }

    /* scrollbar */
    .reader::-webkit-scrollbar { width: 6px; }
    .reader::-webkit-scrollbar-track { background: #f5f5f5; border-radius: 10px; }
    .reader::-webkit-scrollbar-thumb { background: var(--lilac); border-radius: 10px; }

    @media (max-width: 500px) {
      .grid { padding: 16px 16px 50px; gap: 16px; }
      .modal, .reader { padding: 26px 20px; }
    }
  </style>
</head>
<body>

  <header>
    <div class="logo-wrap">
      <span class="logo-bear">🐻</span>
    </div>
    <h1>Bubu Stories</h1>
    <p class="tagline">Poveștile tale magice, într-un singur loc 📖</p>
    <div class="stars">
      <span>⭐</span><span>🌙</span><span>✨</span><span>🌟</span><span>💫</span>
    </div>
  </header>

  <div class="add-btn-wrap">
    <button class="add-btn" onclick="openAddModal()">✏️ Adaugă o poveste</button>
  </div>

  <div class="grid" id="grid"></div>

  <!-- ADD MODAL -->
  <div class="modal-overlay" id="addModal">
    <div class="modal">
      <h2>✨ Poveste nouă</h2>
      <label>Titlul poveștii</label>
      <input type="text" id="storyTitle" placeholder="ex: Bubu și luna de miere..." maxlength="60"/>
      <label>Emoji pentru copertă</label>
      <input type="text" id="storyEmoji" placeholder="ex: 🌙 🦋 🐉 🌸" maxlength="4"/>
      <label>Povestea ta</label>
      <textarea id="storyText" placeholder="A fost odată ca niciodată..."></textarea>
      <div class="modal-actions">
        <button class="btn-cancel" onclick="closeAddModal()">Anulează</button>
        <button class="btn-save" onclick="saveStory()">💾 Salvează</button>
      </div>
    </div>
  </div>

  <!-- READER MODAL -->
  <div class="reader-overlay" id="readerModal">
    <div class="reader">
      <button class="reader-close" onclick="closeReader()">✕</button>
      <div class="reader-emoji" id="readerEmoji"></div>
      <div class="reader-title" id="readerTitle"></div>
      <div class="reader-divider"></div>
      <div class="reader-text" id="readerText"></div>
    </div>
  </div>

  <script>
    const COLORS = [
      'linear-gradient(135deg, #ffd166, #ffb997)',
      'linear-gradient(135deg, #a8edcf, #74c7f0)',
      'linear-gradient(135deg, #c9a8f5, #74c7f0)',
      'linear-gradient(135deg, #ff7f7f, #ffb997)',
      'linear-gradient(135deg, #74c7f0, #a8edcf)',
      'linear-gradient(135deg, #ffd166, #c9a8f5)',
    ];

    let stories = JSON.parse(localStorage.getItem('bubu_stories') || '[]');

    function save() {
      localStorage.setItem('bubu_stories', JSON.stringify(stories));
    }

    function render() {
      const grid = document.getElementById('grid');
      if (stories.length === 0) {
        grid.innerHTML = `
          <div class="empty" style="grid-column: 1/-1;">
            <div class="empty-emoji">📭</div>
            <h3>Nicio poveste încă!</h3>
            <p>Apasă butonul de mai sus și scrie prima ta poveste ✨</p>
          </div>`;
        return;
      }
      grid.innerHTML = stories.map((s, i) => `
        <div class="card" style="animation-delay:${i*0.07}s" onclick="openReader(${i})">
          <div class="card-banner" style="background:${COLORS[i % COLORS.length]}">
            ${s.emoji || '📖'}
          </div>
          <div class="card-body">
            <div class="card-title">${s.title}</div>
            <div class="card-preview">${s.text}</div>
            <div class="card-footer">
              <span class="card-date">${s.date}</span>
              <button class="card-delete" onclick="deleteStory(event, ${i})" title="Șterge">🗑️</button>
            </div>
          </div>
        </div>
      `).join('');
    }

    function openAddModal() {
      document.getElementById('addModal').classList.add('open');
      document.getElementById('storyTitle').focus();
    }
    function closeAddModal() {
      document.getElementById('addModal').classList.remove('open');
      document.getElementById('storyTitle').value = '';
      document.getElementById('storyEmoji').value = '';
      document.getElementById('storyText').value = '';
    }

    function saveStory() {
      const title = document.getElementById('storyTitle').value.trim();
      const text = document.getElementById('storyText').value.trim();
      const emoji = document.getElementById('storyEmoji').value.trim() || '📖';
      if (!title || !text) { alert('Te rog completează titlul și povestea! 🐻'); return; }
      const date = new Date().toLocaleDateString('ro-RO', { day:'numeric', month:'long', year:'numeric' });
      stories.unshift({ title, text, emoji, date });
      save();
      closeAddModal();
      render();
    }

    function openReader(i) {
      const s = stories[i];
      document.getElementById('readerEmoji').textContent = s.emoji || '📖';
      document.getElementById('readerTitle').textContent = s.title;
      document.getElementById('readerText').textContent = s.text;
      document.getElementById('readerModal').classList.add('open');
    }
    function closeReader() {
      document.getElementById('readerModal').classList.remove('open');
    }

    function deleteStory(e, i) {
      e.stopPropagation();
      if (confirm('Ștergi această poveste? 🗑️')) {
        stories.splice(i, 1);
        save();
        render();
      }
    }

    // Close modals on overlay click
    document.getElementById('addModal').addEventListener('click', function(e) {
      if (e.target === this) closeAddModal();
    });
    document.getElementById('readerModal').addEventListener('click', function(e) {
      if (e.target === this) closeReader();
    });

    render();
  </script>
</body>
</html>
