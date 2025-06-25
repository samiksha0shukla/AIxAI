# 🧠 Agenteer V3 – AI Agent Generator with MCP Support

**Agenteer V3** is the third iteration of the Agenteer project, building upon V2 by adding **MCP server support** for seamless integration with AI IDEs like **Windsurf** and **Cursor**.

At its core, Agenteer begins with a **reasoning LLM** that analyzes user requirements and documentation to create a detailed scope. This scope then guides **specialized coding and routing agents** to generate high-quality **Pydantic AI agents**.

## 🚀 What’s New in V3?

What makes **V3** special is its ability to run as an **MCP server**, enabling AI IDEs to:

* Directly leverage Agenteer’s agent generation capabilities
* Automatically write generated code to appropriate files
* Manage dependencies
* Assist in agent testing

This creates a powerful synergy between **agent generation** and **development environments**.

---

## 🔧 Core Architecture

Agenteer features an intelligent **documentation crawler** and **RAG system (Retrieval-Augmented Generation)** built using:

* **Pydantic AI**
* **LangGraph**
* **Supabase**

It crawls the Pydantic AI documentation, stores content in a **vector database**, and provides agent code by retrieving and analyzing relevant documentation chunks.

Supports both:

* **Local LLMs (via Ollama)**
* **Cloud-based LLMs (via OpenAI or OpenRouter)**

---

## ✨ Features

* ✅ **MCP server support** for AI IDE integration
* 🔁 **Multi-agent workflow** using LangGraph
* 👩‍💻 **Specialized agents** for reasoning, routing, and coding
* 📄 **Documentation crawling and chunking**
* 💾 **Vector database storage** using Supabase
* 🧠 **Semantic search** with OpenAI embeddings
* 📚 **RAG-based question answering**
* 💻 **Code block preservation**
* 🌐 **Streamlit UI** for interactive querying

---

## 🛠 Prerequisites

* Python 3.11+
* Supabase account and database
* OpenAI/OpenRouter API key or Ollama
* Streamlit
* Windsurf, Cursor, or any MCP-compatible IDE (optional)

---

## 📦 Installation

### Option 1: Standard Installation (Streamlit UI)

```bash
git clone https://github.com/coleam00/archon.git
cd archon/iterations/v3-mcp-support

# Create virtual environment
python -m venv venv
source venv/bin/activate  # On Windows: venv\Scripts\activate

# Install dependencies
pip install -r requirements.txt
```

### Option 2: MCP Server Setup (for AI IDE Integration)

```bash
# Clone and set up
git clone https://github.com/coleam00/archon.git
cd archon/iterations/v3-mcp-support
python setup_mcp.py
```

To activate virtual environment later:

```bash
source venv/bin/activate  # On Windows: venv\Scripts\activate
```

This will:

* Create a virtual environment
* Install dependencies
* Generate MCP config file

---

## ⚙️ AI IDE Configuration

### In Windsurf:

1. Click on the hammer icon above chat
2. Click "Configure"
3. Paste MCP config JSON from `setup_mcp.py`
4. Click "Refresh"

### In Cursor:

1. Go to Settings > Features > MCP
2. Click "+ Add New MCP Server"
3. Set:

   * Name: `Agenteer`
   * Type: `command`
   * Command: Use the command from `setup_mcp.py`

> **Important:** Restart the MCP server after setup is complete.

---

## 🌍 Environment Setup

1. Rename `.env.example` to `.env`
2. Edit it with your own configuration:

```env
BASE_URL=https://api.openai.com/v1
LLM_API_KEY=your_openai_or_openrouter_api_key
OPENAI_API_KEY=your_openai_api_key
SUPABASE_URL=your_supabase_url
SUPABASE_SERVICE_KEY=your_supabase_service_key
PRIMARY_MODEL=your_main_coding_llm
REASONER_MODEL=your_reasoning_llm
EMBEDDING_MODEL=your_embedding_model
```

---

## 🧮 Database Setup

1. Open Supabase → SQL Editor
2. Paste and run:

   * `utils/site_pages.sql` (for 1536D embeddings)
   * Or `utils/ollama_site_pages.sql` (for 768D embeddings, e.g., `nomic-embed-text`)

---

## 🕸 Crawl Documentation

```bash
python archon/crawl_pydantic_ai_docs.py
```

This will:

* Crawl the docs
* Split into chunks
* Generate embeddings
* Store them in Supabase

---

## 🤖 Using with AI IDEs (MCP Support)

1. After crawling, start the agent graph service:

```bash
python graph_service.py
```

> Agenteer runs as a **separate API endpoint** to avoid LLM call interference and allow independent updates.

2. Restart your MCP server in the IDE
3. You can now generate agents directly via your IDE

---

## 🌐 Using the Streamlit UI

```bash
streamlit run streamlit_ui.py
```

Visit: [http://localhost:8501](http://localhost:8501)

---

## 🗃 Database Schema

```sql
CREATE TABLE site_pages (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    url TEXT,
    chunk_number INTEGER,
    title TEXT,
    summary TEXT,
    content TEXT,
    metadata JSONB,
    embedding VECTOR(1536) -- or VECTOR(768) for nomic-embed-text
);
```

---

## 📁 Project Structure

### 🧠 Core Files
- `mcp_server.py` — MCP server script for AI IDE integration  
- `graph_service.py` — FastAPI service that handles the agentic workflow  
- `setup_mcp.py` — MCP setup script  
- `streamlit_ui.py` — Web interface with streaming support  
- `requirements.txt` — Project dependencies  
- `.env.example` — Example environment variables  

### 🧩 Agenteer Package (`archon/`)
- `archon_graph.py` — LangGraph workflow definition and agent coordination  
- `pydantic_ai_coder.py` — Main coding agent with RAG capabilities  
- `crawl_pydantic_ai_docs.py` — Documentation crawler and processor  

### 🛠️ Utilities (`utils/`)
- `utils.py` — Shared utility functions  
- `site_pages.sql` — Database setup commands  
- `site_pages_ollama.sql` — Setup commands for embeddings with 768 dimensions (`nomic-embed-text`)  

### 🧪 Runtime
- `workbench/` — Runtime files and logs  
- `venv/` — Python virtual environment (created during setup)  

### 🤝 Contributing
Contributions are welcome! Please feel free to submit a Pull Request.
