```mermaid
flowchart LR
    subgraph motor wasmVision
        Capture
        Runtime[WASM Runtime - Wazero]
        Capture--frame-->Runtime
        Capture<-->opencv
        Runtime<-->opencv
    end
    subgraph opencv
        modulos[modulos OpenCV]
        FFmpeg
        GStreamer
    end
    subgraph procesadores wasmVision
        Runtime--frame-->tinygo-processor.wasm
        Runtime--frame-->rust-processor.wasm
        Runtime--frame-->c-processor.wasm
    end
```
