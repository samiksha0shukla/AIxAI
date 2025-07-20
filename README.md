# **AIxAI V2 - AI Agent Generator with MCP Support**

This is the second version of the AIxAI project, building upon V2 by adding MCP server support for seamless integration with AI IDEs like **Windsurf** and **Cursor**. The system starts with a reasoning LLM that analyzes user requirements and documentation to create a detailed scope, which then guides specialized coding and routing agents in generating high-quality **Pydantic AI agents**.

What makes V3 special is its ability to run as an **MCP server**, allowing AI IDEs to directly leverage AIxAI's agent generation capabilities. When you ask your AI IDE to create a new agent, AIxAI can not only generate the code but the IDE can automatically write it to the appropriate files, manage dependencies, and help you test the agent — creating a powerful synergy between agent generation and development environment.

The core remains an intelligent documentation crawler and **RAG (Retrieval-Augmented Generation)** system built using **Pydantic AI**, **LangGraph**, and **Supabase**. The system crawls the Pydantic AI documentation, stores content in a vector database, and provides Pydantic AI agent code by retrieving and analyzing relevant documentation chunks.

This version supports both local LLMs with **Ollama** and cloud-based LLMs through **OpenAI/OpenRouter**.

---

## **Features**

* MCP server support for AI IDE integration
* Multi-agent workflow using **LangGraph**
* Specialized agents for reasoning, routing, and coding
* Pydantic AI documentation crawling and chunking
* Vector database storage with **Supabase**
* Semantic search using **OpenAI embeddings**
* RAG-based question answering
* Support for code block preservation
* Streamlit UI for interactive querying

---

## **Prerequisites**

* Python 3.11+
* Supabase account and database
* OpenAI/OpenRouter API key or Ollama for local LLMs
* Streamlit (for web interface)
* Windsurf, Cursor, or another MCP-compatible AI IDE (optional)

---

## AIxAI Agent Architectures

![Screenshot (2178)](https://github.com/user-attachments/assets/2867183b-9e92-4197-a4e9-d85c609a4225)

---

## **Installation**

### **Option 1: Standard Installation (for using the Streamlit UI)**

1. Clone the repository:

```bash
https://github.com/samiksha0shukla/AIxAI.git
cd archon/versions/v2-mcp_support
```

2. Install dependencies:

```bash
python -m venv venv
source venv/bin/activate  # On Windows: venv\Scripts\activate
pip install -r requirements.txt
```

---

### **Option 2: MCP Server Setup (for AI IDE integration)**

1. Clone the repository as above
2. Run the MCP setup script:

```bash
python setup_mcp.py
```

3. For running the crawler and graph service later, activate the virtual environment:

```bash
source venv/bin/activate  # On Windows: venv\Scripts\activate
```

This will:

* Create a virtual environment if it doesn't exist
* Install dependencies from `requirements.txt`
* Generate an MCP configuration file

---

### **Configure your AI IDE**

#### **In Windsurf:**

* Click on the hammer icon above the chat input
* Click on **"Configure"**
* Paste the JSON that `setup_mcp.py` gave you as the MCP config
* Click **"Refresh"** next to **"Configure"**

#### **In Cursor:**

* Go to **Cursor Settings > Features > MCP**
* Click on **"+ Add New MCP Server"**
* Name: **AIxAI**
* Type: **command** (equivalent to stdio)
* Command: Paste the command that `setup_mcp.py` gave for Cursor

> ⚠️ **NOTE:** This MCP server will only be functional once you complete the steps below! Be sure to restart your MCP server after finishing all steps.

---

## **Environment Setup**

1. Rename `.env.example` to `.env`
2. Edit `.env` with your API keys and preferences:

```
BASE_URL=https://api.openai.com/v1           # OpenAI
# OR
BASE_URL=https://api.openrouter.ai/v1        # OpenRouter
# OR
BASE_URL=http://localhost:11434              # Ollama

LLM_API_KEY=your_openai_or_openrouter_api_key  
OPENAI_API_KEY=your_openai_api_key  
SUPABASE_URL=your_supabase_url  
SUPABASE_SERVICE_KEY=your_supabase_service_key  
PRIMARY_MODEL=your_main_coding_llm  
REASONER_MODEL=your_reasoning_llm  
EMBEDDING_MODEL=your_embedding_model  
```

---

## **Usage**

### **Database Setup**

Execute the SQL commands in `utils/site_pages.sql` to:

* Create the necessary tables
* Enable vector similarity search
* Set up Row Level Security policies

> In **Supabase**, go to the **"SQL Editor"** tab, paste the SQL into the editor, then click **"Run"**.

> 📝 If using **Ollama** with the `nomic-embed-text` embedding model or another with 768 dimensions, either update `site_pages.sql` to use 768 instead of 1536, or use `utils/ollama_site_pages.sql`.

---

### **Crawl Documentation**

To crawl and store documentation in the vector database:

```bash
python aixai/knowledgebase.py
```

This will:

* Fetch URLs from the documentation sitemap
* Crawl each page and split into chunks
* Generate embeddings and store in Supabase

---

### **Using with AI IDEs (MCP Support)**

After crawling the documentation, start the graph service:

```bash
python graph_service.py
```

AIxAI runs as a separate API endpoint for MCP instead of directly in the MCP server. This allows AIxAI to be updated separately without needing to restart the MCP server, and avoids communication protocol conflicts with LLM calls.

✅ **Restart the MCP server in your AI IDE**
✅ You can now ask your AI IDE to create agents with AIxAI
✅ Be sure to specify when you want to use AIxAI – not necessary but helpful

---

### **Using the Streamlit UI**

To launch the interactive web interface:

```bash
streamlit run streamlit_ui.py
```

The interface will be available at: [http://localhost:8501](http://localhost:8501)

---

## **Configuration**

### **Database Schema**

The Supabase database uses the following schema:

```sql
CREATE TABLE site_pages (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    url TEXT,
    chunk_number INTEGER,
    title TEXT,
    summary TEXT,
    content TEXT,
    metadata JSONB,
    embedding VECTOR(1536) -- Adjust dimensions as necessary (i.e. 768 for nomic-embed-text)
);
```

---

## **Project Structure**

### **Core Files**

* `mcp_server.py`: MCP server script for AI IDE integration
* `graph_service.py`: FastAPI service that handles the agentic workflow
* `setup_mcp.py`: MCP setup script
* `user_interface.py`: Web interface with streaming support
* `requirements.txt`: Project dependencies
* `.env.example`: Example environment variables

---

### **AIxAI Package**

* `aixai/`: Core agent and workflow implementation

  * `multi_agent.py`: LangGraph workflow definition and agent coordination
  * `pydantic_ai_coder.py`: Main coding agent with RAG capabilities
  * `knowledgebase.py`: Documentation crawler and processor

---

### **Utilities**

* `utils/`: Utility functions and database setup

  * `utils.py`: Shared utility functions
  * `site_pages.sql`: Database setup commands

---

### **Runtime**

* `workbench/`: Runtime files and logs
* `venv/`: Python virtual environment (created by setup)

---

## **Contributing**

Contributions are welcome! Please feel free to submit a **Pull Request**.

---
