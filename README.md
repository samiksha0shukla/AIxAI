# Agenteer
# 🧠 Multi-Model AI Agent with Pydantic AI, LangGraph & Supabase

This project is a **multi-model AI agent** framework built using the latest in AI orchestration, document retrieval, and modular tooling. The system is designed to interpret user requests and automatically define, plan, and build scoped AI solutions by leveraging structured reasoning, document grounding, and agentic LLM pipelines.

It combines **LangGraph**, **Pydantic AI**, **Supabase**, **OpenAI**, and a **reasoning engine** to provide an extensible framework for building advanced task-specific agents — with human feedback, modular tools, and RAG (Retrieval-Augmented Generation) at its core.

---

## 🚀 Features

- ✅ **Agentic RAG**: Retrieves and reasons over structured documentation pages from Supabase.
- ✅ **Structured Agent Reasoning**: Uses a dedicated `reasoner` LLM to define project scopes including architecture, components, dependencies, and more.
- ✅ **Multi-turn Conversation Memory**: Maintains a full message history using `Pydantic` type adapters.
- ✅ **Streaming Code Generation**: Generates outputs in real-time with streaming responses from the coder agent.
- ✅ **LangGraph Integration**: Uses graph-based execution and state tracking to model multi-step agent workflows.
- ✅ **Supabase Integration**: Dynamically retrieves relevant documentation context from a centralized vector/document database.
- ✅ **Tool-Enhanced Agent**: Custom tools like `list_documentation_pages()` are defined and registered within the agent.
- ✅ **Human-in-the-loop Ready**: Scope files and reasoning steps are saved for manual validation or refinement.

---

## 🧰 Technologies Used

| Technology         | Role in the Project |
|-------------------|---------------------|
| **LangGraph**      | Manages agent state and execution flow across steps |
| **Pydantic AI**    | Provides tool registration, validation, structured agent interactions |
| **Supabase**       | Backend data store for documentation retrieval and grounding |
| **OpenAI GPT Models** | Used for reasoning, conversation, and code generation |
| **Ollama (optional)** | Enables local inference as a fallback or alternative to OpenAI |
| **RAG (Retrieval-Augmented Generation)** | Combines user input with contextual doc pages for accurate outputs |
| **Reasoner LLM**   | Custom LLM step that defines scope and architecture from user needs |
| **Streaming UI**   | Streams generated text output to the frontend for responsive UX |
| **Human-in-the-loop** | Manual review or correction of generated scope or outputs |

---

## 📦 Project Structure
├── crawl4ai+supabase.py # Script to crawl documentation and upload to Supabase
├── pydantic_ai_coder.py # Defines tools and coder logic using Pydantic AI
├── pydantic+langgraph.py # Main agent orchestration using LangGraph
├── user_interface.py # CLI or UI stream interface to interact with the agent
├── workbench/
│ └── scope.md # Output file containing the generated agent scope
├── requirements.txt
└── README.md
---

## ⚙️ Prerequisites

- Python 3.10+
- Access to [OpenAI API](https://platform.openai.com/)
- A running [Supabase](https://supabase.com/) project with:
  - A table named `site_pages`
  - Documentation indexed under the `metadata->>source` field
- Optionally: [Ollama](https://ollama.com/) for local LLMs
- Basic understanding of LangGraph and Pydantic if extending the agent

---

## 📦 Installation

```bash
# Clone the repo
git clone https://github.com/your-username/multi-model-ai-agent.git
cd multi-model-ai-agent

# Create and activate a virtual environment
python -m venv .venv
source .venv/bin/activate  # or .venv\Scripts\activate on Windows

# Install dependencies
pip install -r requirements.txt
