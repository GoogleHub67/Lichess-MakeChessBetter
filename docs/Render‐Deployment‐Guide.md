# ☁️ Deploying the Bot to Render (24/7 Uptime)

This project includes a `Dockerfile` and an `app.py` entry point, making it completely optimized for free cloud hosting on **Render.com**.

### Deployment Steps:
1. **Fork this repository** to your personal GitHub account.
2. Sign up or log into the [Render Dashboard](https://render.com).
3. Click **New +** and select **Web Service**.
4. Connect your forked GitHub repository.
5. Configure the following environment settings:
   * **Runtime:** `Docker`
   * **Instance Type:** `Free`
6. Add your Lichess token under the **Environment Variables** tab:
   * Key: `Lichess_TOKEN`
   * Value: `lip_your_actual_token_here`
7. Click **Deploy Web Service**. Render will automatically read the `Dockerfile`, install Python, download Stockfish dependencies, and launch your bot container loop.
