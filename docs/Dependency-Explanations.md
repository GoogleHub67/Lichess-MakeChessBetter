# 📊 Dependency Explanations & Package Architecture

When you build or deploy **Lichess-MakeChessBetter**, running `pip install -r requirements.txt` downloads quite a few packages. 

**Do not worry!** Our codebase only explicitly imports **13 core libraries**. The rest are **transitive dependencies**—background utilities automatically requested by major frameworks like `Streamlit`, `Flask`, and `Gevent` to handle low-level networking, UI building, and text parsing.

---

## 🌳 Full Dependency Family Tree
This live map visualizes exactly which core framework brought which background package into your environment:

```text
berserk==0.14.0
├── Deprecated [required: >=1.2.14, installed: 3.0.0]
│   └── wrapt [required: >=1.16,<3, installed: 2.5.0]
├── ndjson [required: >=0.3.1, installed: 0.3.1]
├── python-dateutil [required: >=2.8.2, installed: 2.9.0.post0]
│   └── six [required: >=1.5, installed: 1.17.0]
├── requests [required: >=2.28.2, installed: 2.34.2]
│   ├── certifi [required: >=2023.5.7, installed: 2026.7.22]
│   ├── charset-normalizer [required: >=2,<4, installed: 3.5.1]
│   ├── idna [required: >=2.5,<4, installed: 3.19]
│   └── urllib3 [required: >=1.26,<3, installed: 2.7.0]
└── typing_extensions [required: >=4.7.1, installed: 4.16.0]
chess==1.10.0
Flask==3.1.3
├── blinker [required: >=1.9.0, installed: 1.9.0]
├── click [required: >=8.1.3, installed: 8.5.0]
├── itsdangerous [required: >=2.2.0, installed: 2.2.0]
├── Jinja2 [required: >=3.1.2, installed: 3.1.6]
│   └── MarkupSafe [required: >=2.0, installed: 3.0.3]
├── MarkupSafe [required: >=2.1.1, installed: 3.0.3]
└── Werkzeug [required: >=3.1.0, installed: 3.1.9]
    └── MarkupSafe [required: >=2.1.1, installed: 3.0.3]
gevent==26.9.0
├── greenlet [required: >=3.2.2, installed: 3.5.6]
├── zope.event [required: Any, installed: 6.2]
└── zope.interface [required: Any, installed: 8.6]
gunicorn==26.2.0
httpx==0.28.1
├── anyio [required: Any, installed: 4.15.1]
│   ├── idna [required: >=2.8, installed: 3.19]
│   └── typing_extensions [required: >=4.16.0, installed: 4.16.0]
├── certifi [required: Any, installed: 2026.7.22]
├── httpcore [required: ==1.*, installed: 1.0.9]
│   ├── certifi [required: Any, installed: 2026.7.22]
│   └── h11 [required: >=0.16, installed: 0.16.0]
└── idna [required: Any, installed: 3.19]
myst-parser==5.1.0
├── docutils [required: >=0.20,<0.23, installed: 0.22.4]
├── Jinja2 [required: Any, installed: 3.1.6]
│   └── MarkupSafe [required: >=2.0, installed: 3.0.3]
├── markdown-it-py [required: ~=4.2, installed: 4.2.0]
│   └── mdurl [required: ~=0.1, installed: 0.1.2]
├── mdit-py-plugins [required: ~=0.6,>=0.6.1, installed: 0.6.1]
│   └── markdown-it-py [required: >=2.0.0,<5.0.0, installed: 4.2.0]
│       └── mdurl [required: ~=0.1, installed: 0.1.2]
├── PyYAML [required: Any, installed: 6.0.3]
└── Sphinx [required: >=8,<10, installed: 9.1.0]
    ├── alabaster [required: >=0.7.14, installed: 1.0.0]
    ├── babel [required: >=2.13, installed: 2.18.0]
    ├── docutils [required: >=0.21,<0.23, installed: 0.22.4]
    ├── imagesize [required: >=1.3, installed: 2.0.1]
    ├── Jinja2 [required: >=3.1, installed: 3.1.6]
    │   └── MarkupSafe [required: >=2.0, installed: 3.0.3]
    ├── packaging [required: >=23.0, installed: 26.3]
    ├── Pygments [required: >=2.17, installed: 2.21.0]
    ├── requests [required: >=2.30.0, installed: 2.34.2]
    │   ├── certifi [required: >=2023.5.7, installed: 2026.7.22]
    │   ├── charset-normalizer [required: >=2,<4, installed: 3.5.1]
    │   ├── idna [required: >=2.5,<4, installed: 3.19]
    │   └── urllib3 [required: >=1.26,<3, installed: 2.7.0]
    ├── roman-numerals [required: >=1.0.0, installed: 4.1.0]
    ├── snowballstemmer [required: >=2.2, installed: 3.1.1]
    ├── sphinxcontrib-applehelp [required: >=1.0.7, installed: 2.0.0]
    ├── sphinxcontrib-devhelp [required: >=1.0.6, installed: 2.0.0]
    ├── sphinxcontrib-htmlhelp [required: >=2.0.6, installed: 2.1.0]
    ├── sphinxcontrib-jsmath [required: >=1.0.1, installed: 1.0.1]
    ├── sphinxcontrib-qthelp [required: >=1.0.6, installed: 2.0.0]
    └── sphinxcontrib-serializinghtml [required: >=1.1.9, installed: 2.0.0]
python-dotenv==1.2.4
sphinx_rtd_theme==3.1.0
├── docutils [required: >0.18,<0.23, installed: 0.22.4]
├── Sphinx [required: >=6,<10, installed: 9.1.0]
│   ├── alabaster [required: >=0.7.14, installed: 1.0.0]
│   ├── babel [required: >=2.13, installed: 2.18.0]
│   ├── docutils [required: >=0.21,<0.23, installed: 0.22.4]
│   ├── imagesize [required: >=1.3, installed: 2.0.1]
│   ├── Jinja2 [required: >=3.1, installed: 3.1.6]
│   │   └── MarkupSafe [required: >=2.0, installed: 3.0.3]
│   ├── packaging [required: >=23.0, installed: 26.3]
│   ├── Pygments [required: >=2.17, installed: 2.21.0]
│   ├── requests [required: >=2.30.0, installed: 2.34.2]
│   │   ├── certifi [required: >=2023.5.7, installed: 2026.7.22]
│   │   ├── charset-normalizer [required: >=2,<4, installed: 3.5.1]
│   │   ├── idna [required: >=2.5,<4, installed: 3.19]
│   │   └── urllib3 [required: >=1.26,<3, installed: 2.7.0]
│   ├── roman-numerals [required: >=1.0.0, installed: 4.1.0]
│   ├── snowballstemmer [required: >=2.2, installed: 3.1.1]
│   ├── sphinxcontrib-applehelp [required: >=1.0.7, installed: 2.0.0]
│   ├── sphinxcontrib-devhelp [required: >=1.0.6, installed: 2.0.0]
│   ├── sphinxcontrib-htmlhelp [required: >=2.0.6, installed: 2.1.0]
│   ├── sphinxcontrib-jsmath [required: >=1.0.1, installed: 1.0.1]
│   ├── sphinxcontrib-qthelp [required: >=1.0.6, installed: 2.0.0]
│   └── sphinxcontrib-serializinghtml [required: >=1.1.9, installed: 2.0.0]
└── sphinxcontrib-jquery [required: >=4,<5, installed: 4.1]
    └── Sphinx [required: >=1.8, installed: 9.1.0]
        ├── alabaster [required: >=0.7.14, installed: 1.0.0]
        ├── babel [required: >=2.13, installed: 2.18.0]
        ├── docutils [required: >=0.21,<0.23, installed: 0.22.4]
        ├── imagesize [required: >=1.3, installed: 2.0.1]
        ├── Jinja2 [required: >=3.1, installed: 3.1.6]
        │   └── MarkupSafe [required: >=2.0, installed: 3.0.3]
        ├── packaging [required: >=23.0, installed: 26.3]
        ├── Pygments [required: >=2.17, installed: 2.21.0]
        ├── requests [required: >=2.30.0, installed: 2.34.2]
        │   ├── certifi [required: >=2023.5.7, installed: 2026.7.22]
        │   ├── charset-normalizer [required: >=2,<4, installed: 3.5.1]
        │   ├── idna [required: >=2.5,<4, installed: 3.19]
        │   └── urllib3 [required: >=1.26,<3, installed: 2.7.0]
        ├── roman-numerals [required: >=1.0.0, installed: 4.1.0]
        ├── snowballstemmer [required: >=2.2, installed: 3.1.1]
        ├── sphinxcontrib-applehelp [required: >=1.0.7, installed: 2.0.0]
        ├── sphinxcontrib-devhelp [required: >=1.0.6, installed: 2.0.0]
        ├── sphinxcontrib-htmlhelp [required: >=2.0.6, installed: 2.1.0]
        ├── sphinxcontrib-jsmath [required: >=1.0.1, installed: 1.0.1]
        ├── sphinxcontrib-qthelp [required: >=1.0.6, installed: 2.0.0]
        └── sphinxcontrib-serializinghtml [required: >=1.1.9, installed: 2.0.0]
streamlit==1.65.0
├── altair [required: >=5.0.0,!=5.4.0,!=5.4.1,<7, installed: 6.3.0]
│   ├── Jinja2 [required: Any, installed: 3.1.6]
│   │   └── MarkupSafe [required: >=2.0, installed: 3.0.3]
│   ├── jsonschema [required: >=3.0, installed: 4.26.0]
│   │   ├── attrs [required: >=22.2.0, installed: 26.1.0]
│   │   ├── jsonschema-specifications [required: >=2023.3.6, installed: 2025.9.1]
│   │   │   └── referencing [required: >=0.31.0, installed: 0.37.0]
│   │   │       ├── attrs [required: >=22.2.0, installed: 26.1.0]
│   │   │       └── rpds-py [required: >=0.7.0, installed: 2026.6.3]
│   │   ├── referencing [required: >=0.28.4, installed: 0.37.0]
│   │   │   ├── attrs [required: >=22.2.0, installed: 26.1.0]
│   │   │   └── rpds-py [required: >=0.7.0, installed: 2026.6.3]
│   │   └── rpds-py [required: >=0.25.0, installed: 2026.6.3]
│   ├── narwhals [required: >=2.4.0, installed: 2.26.0]
│   ├── packaging [required: Any, installed: 26.3]
│   └── typing_extensions [required: >=4.12.0, installed: 4.16.0]
├── anyio [required: >=4.0.0,<5, installed: 4.15.1]
│   ├── idna [required: >=2.8, installed: 3.19]
│   └── typing_extensions [required: >=4.16.0, installed: 4.16.0]
├── click [required: >=7.0,<9, installed: 8.5.0]
├── httptools [required: >=0.6.3,<1, installed: 0.8.0]
├── itsdangerous [required: >=2.1.2,<3, installed: 2.2.0]
├── numpy [required: >=1.23,<3, installed: 2.5.3]
├── packaging [required: >=20, installed: 26.3]
├── pandas [required: >=1.4.0,<4, installed: 3.0.6]
│   ├── numpy [required: >=2.3.3, installed: 2.5.3]
│   └── python-dateutil [required: >=2.8.2, installed: 2.9.0.post0]
│       └── six [required: >=1.5, installed: 1.17.0]
├── pillow [required: >=7.1.0,<13, installed: 12.3.0]
├── protobuf [required: >=5.26.1,<8, installed: 7.36.2]
├── pyarrow [required: >=7.0,!=25.0.0,<26, installed: 25.0.1]
├── pydeck [required: >=0.8.0b4,<1, installed: 0.9.3]
│   ├── Jinja2 [required: >=2.10.1, installed: 3.1.6]
│   │   └── MarkupSafe [required: >=2.0, installed: 3.0.3]
│   └── numpy [required: >=1.16.4, installed: 2.5.3]
├── python-multipart [required: >=0.0.10,<1, installed: 0.0.32]
├── requests [required: >=2.27,<3, installed: 2.34.2]
│   ├── certifi [required: >=2023.5.7, installed: 2026.7.22]
│   ├── charset-normalizer [required: >=2,<4, installed: 3.5.1]
│   ├── idna [required: >=2.5,<4, installed: 3.19]
│   └── urllib3 [required: >=1.26,<3, installed: 2.7.0]
├── starlette [required: >=0.46.0,<2, installed: 1.7.0]
│   └── anyio [required: >=4.0.0,<5, installed: 4.15.1]
│       ├── idna [required: >=2.8, installed: 3.19]
│       └── typing_extensions [required: >=4.16.0, installed: 4.16.0]
├── toml [required: >=0.10.1,<2, installed: 0.10.2]
├── typing_extensions [required: >=4.10.0,<5, installed: 4.16.0]
├── uvicorn [required: >=0.30.0,<1, installed: 0.54.0]
│   ├── click [required: >=7.0, installed: 8.5.0]
│   └── h11 [required: >=0.8, installed: 0.16.0]
├── watchdog [required: >=2.1.5,<7, installed: 6.0.0]
└── websockets [required: >=12.0.0,<18, installed: 17.2]
```

---

## 🔍 Deep-Dive: What do these background tools actually do?

To keep our repository transparent and auditable, here is an explicit breakdown of the main background utility blocks:

### 1. Data Crunching & Graphics (Brought by `streamlit`)
*   **`pandas` & `numpy`**: Act as the memory engine. When we load multiple chess games or match records, these libraries parse raw data into structured tables at lightning speed.
*   **`altair` & `narwhals`**: Build interactive dashboards. If you want to graph a player's rating progression over time, Altair renders the graphs inside the browser.
*   **`pillow`**: An image wrapper. It handles the display of custom assets, images, and visual components on the frontend.

### 2. Micro-Networking Layers (Brought by `requests` & `httpx`)
*   **`urllib3`, `httpcore`, `h11`**: These handle low-level internet connections. They open persistent pipelines to Lichess servers so your app can request player profiles without constantly stalling the network socket.
*   **`certifi`, `idna`, `charset-normalizer`**: Critical security blocks. They confirm that the SSL certificates provided by the Lichess API are authentic and securely encrypted.

### 3. Asynchronous Concurrency (Brought by `gevent` & `gunicorn`)
*   **`greenlet`**: Implements "micro-threads". Instead of slowing down your machine by spinning up heavy operating system processes, it switches tasks smoothly whenever the app is waiting for an API response.
*   **`zope.interface`**: Assures architectural components connect seamlessly on production-ready servers.

### 4. Text and Documentation Processing (Brought by `myst-parser`)
*   **`Sphinx` Ecosystem**: An automated toolkit that compiles code comments and Markdown guides into gorgeous, readable documentation web pages.
*   **`Pygments`**: Provides beautiful code color syntax highlighting inside your app UI or docs.

---

*This document is automatically updated when major architecture changes occur. For questions or deployment security auditing, open an issue in the [Lichess-MakeChessBetter](https://github.com/GoogleHub67/Lichess-MakeChessBetter/issues) workspace repository.*
