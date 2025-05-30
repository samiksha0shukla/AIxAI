# Agenteer
# 🧠 AI Agent Builder using Pydantic AI, LangGraph & Supabase

This project is a Autonomous AI Agent Builder using Pydantic AI framework built using the latest in AI orchestration, document retrieval, and modular tooling. Introducing **LangGraph** for a complete **agentic workflow**. The system is designed as an **AI agent that autonomously builds other AI agents**. The system is designed to interpret user requests and automatically define, plan, and build scoped AI solutions by leveraging structured reasoning, document grounding, and agentic LLM pipelines.

At its core, Agenteer uses a reasoning LLM (like O3-mini or R1) to interpret user requirements, analyze documentation, and define detailed scope documents. These are then passed on to specialized coding and routing agents that generate high-quality Pydantic AI agents using relevant documentation and structured prompts.

An intelligent documentation crawler, semantic retriever, and multi-agent LLM orchestrator come together to handle the entire lifecycle of AI agent generation — from planning to code delivery.

It combines **LangGraph**, **Pydantic AI**, **Supabase**, **OpenAI**, and a **reasoning engine** to provide an extensible framework for building advanced task-specific agents — with human feedback (human-in-the-loop), modular tools, and RAG (Retrieval-Augmented Generation) at its core.

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
- ✅ **Specialized agents for reasoning, routing, and coding**
- ✅ **Pydantic AI documentation crawling and chunking**

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
- `knowledgebase.py`: Script to crawl documentation and upload to Supabase
- `pydantic_ai_coder.py`: Defines tools and coder logic using Pydantic AI
- `multi_agent.py`: Main agent orchestration using LangGraph
- `user\_interface.py`: CLI or UI stream interface to interact with the agent
- `workbench/`
   - `scope.md`: Output file containing the generated agent scope
- `requirements.txt`
- `README.md`

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
````

---

## 🚀 Usage

### 1. 🌐 Load Documentation into Supabase

If you haven’t populated Supabase yet:

```bash
python knowledgebase.py
```

This script crawls Pydantic AI documentation, chunks it, and pushes it into the Supabase `site_pages` table for RAG-based querying.

### 2. 🤖 Run the AI Agent

```bash
streamlit run user_interface.py
```

This launches the system and prompts you to provide a user goal like:

```
"Build me an AI agent that verifies inputs using Pydantic and routes API requests."
```
