name: Bug Report
description: Report an issue with game loop connection, CPL calculation, or engine moves
title: '[BOT-BUG] '
labels: ["bug"]
body:
  - type: markdown
    attributes:
      value: |
        ### Help us squash this bug!
        Please fill out the form below with as much detail as possible to help isolate the problem.
  - type: textarea
    id: description
    attributes:
      label: Describe the bug
      description: A clear description of what went wrong during runtime or mid-game execution.
    validations:
      required: true
  - type: textarea
    id: reproduction
    attributes:
      label: To Reproduce
      description: Steps to reproduce the behavior.
      value: |
        1. Start the bot with `python bot.py`
        2. Challenge the bot on Lichess with variant...
        3. Observe crash message / incorrect behaviour in engine response
    validations:
      required: true
  - type: textarea
    id: expected-behavior
    attributes:
      label: Expected behavior
      description: What the bot should have done (e.g., accepted draw, adjusted ELO properly, sent move).
    validations:
      required: true
  - type: input
    id: game-url
    attributes:
      label: Lichess Game URL
      description: If applicable, provide the link to the game where this happened.
      placeholder: E.g., https://lichess.org
    validations:
      required: false
  - type: textarea
    id: console-logs
    attributes:
      label: Console Logs
      description: Paste the terminal or command prompt output right before the crash occurred.
      render: text
      placeholder: Paste log stream output here...
    validations:
      required: false
  - type: dropdown
    id: os
    attributes:
      label: Operating System
      options:
        - Windows
        - Linux / Ubuntu
        - macOS
        - Cloud Hosted (Render, etc.)
        - Other
    validations:
      required: true
  - type: input
    id: engine-version
    attributes:
      label: Stockfish / Fairy-Stockfish Version
      placeholder: E.g., Stockfish 16, Fairy-Stockfish 14
    validations:
      required: true
  - type: input
    id: python-version
    attributes:
      label: Python Version
      placeholder: E.g., 3.10, 3.11
    validations:
      required: true
