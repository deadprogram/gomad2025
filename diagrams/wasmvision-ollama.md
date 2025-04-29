```mermaid
flowchart LR
    subgraph motor wasmVision
        Capture
        Runtime[WASM Runtime]
        Capture--frame-->Runtime
        Capture<-->OpenCV
        Runtime<-->OpenCV
        Config
        Datastore
        OpenCV<--DNN-->DNN[Mosaic - modelo de transferencia rápida de estilo neuronal]
    end
    subgraph procesadores wasmVision
        Runtime--frame-->ollama.wasm
        Runtime--frame-->styletransfer.wasm
        Runtime--frame-->captions.wasm
    end
    ollama.wasm--frame-->ollama
    subgraph ollama
        llava[LLaVA - Large Language and Vision Assistant Model]
    end
    ollama.wasm<-->Config
    ollama.wasm<-->Datastore
    captions.wasm<-->Datastore
    OpenCV<--CUDA-->GPU
    ollama<--CUDA-->GPU
```
