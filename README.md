# 🧠 QA Assistant — RAG + FAISS + Gemini + Flask  
A Retrieval-Augmented Generation (RAG) based Question Answering system using **FAISS**, **Sentence Transformer embeddings**, and **Gemini LLM**, wrapped in a **Flask web application**, and deployed to **Hugging Face Spaces**.

🔗 **Live Demo:**  
👉 https://huggingface.co/spaces/mounikamm17/QA-Assistant  

---

## 🚀 Features

### 🔍 **1. RAG Pipeline (Retrieval-Augmented Generation)**
- Uses **FAISS (Facebook AI Similarity Search)** for high-speed vector similarity search.
- PDF documents stored in `knowledge_base/` are converted into embeddings.
- Relevant chunks are retrieved to provide grounded LLM responses.

### 🧬 **2. Embeddings**
- Powered by **Hugging Face Sentence Transformers** (e.g., `all-MiniLM-L6-v2`).
- Converts PDF text into dense vector embeddings for FAISS indexing.

### 🤖 **3. LLM: Google Gemini**
- Uses **Gemini Pro / Gemini API** to generate contextual answers.
- Combines retrieved context + user query for high-quality responses.

### 🌐 **4. Flask Frontend**
- Clean and lightweight UI served via Flask.
- HTML templates located under `app/templates/`
- Static assets under `app/static/`

### 🚢 **5. Deployment**
- Fully containerized using **Docker**.
- Hosted on **Hugging Face Spaces** (Docker SDK).
- Production-ready using **Gunicorn** WSGI server.

---

## 📁 Project Structure

qa-assistant/  
│  
├── app/  
│ ├── init.py # Exposes app = create_app()  
│ ├── app.py # Flask routes + create_app()  
│ ├── llm_client.py # Gemini model integration  
│ ├── rag_store.py # FAISS index + embedding logic  
│ ├── knowledge_base/ # PDF documents for RAG  
│ ├── templates/ # HTML templates  
│ └── static/ # CSS / JS / Images  
│
├── qa_faiss_store/ # FAISS index persistence  
│
├── Dockerfile # Hugging Face Space container  
├── requirements.txt # Python dependencies  
├── README.md   
└── notes.txt    


---

## 🛠️ Technologies Used

| Component | Technology |
|----------|------------|
| **Vector DB** | FAISS |
| **Embeddings** | Sentence Transformers (Hugging Face) |
| **LLM** | Google Gemini API |
| **Backend Framework** | Flask |
| **Frontend** | HTML + CSS + JS (Jinja Templates) |
| **WSGI Server** | Gunicorn |
| **Deployment** | Hugging Face Spaces (Docker SDK) |

---

## ▶️ Running the App Locally

Follow these steps after cloning the repo.

###  Step 1- Clone the repository  

git clone https://github.com/<your-username>/qa-assistant.git
cd qa-assistant


### Step 2-  Create a Virtual Environment
python -m venv venv  
source venv/bin/activate      # macOS / Linux  
venv\Scripts\activate         # Windows


### Step 3- Install dependencies  
pip install -r requirements.txt

### Step 4- Add your API Keys
GEMINI_API_KEY=your_key_here  


### Step 5- Build or refresh FAISS index  
python -m app.rag_store

### Step 6-  Run the Flask App
python -m app.app

### Step 7- Open in browser
http://localhost:8000


🌐 Live Demo on Hugging Face Spaces  

You can test the working app without cloning or installing anything:  

👉 https://huggingface.co/spaces/mounikamm17/QA-Assistant  

This link runs the app inside Hugging Face’s Docker environment.  


🤝 Contributing

Contributions, suggestions, and improvements are welcome!
Feel free to open issues or submit pull requests.


📄 License

MIT License

## 🧑‍💻 Author  
Mounika Maradana  
📧 https://www.linkedin.com/in/mounikamaradana/  
🌐 https://github.com/Mounika-17  


