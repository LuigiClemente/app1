```mermaid
sequenceDiagram
    participant iPhone
    participant App1 as "App 1 (Local Computer)"
    participant App2 as "App 2 (Remote Server)"
    participant Web2 as "Web 2 (UI)"

    iPhone->>App1: Stream phone call via Bluetooth
    App1->>App2: Stream phone call
    App2->>Web2: Stream phone call via WebSocket
    Web2->>Web2: User interacts and updates UI
    Web2->>App2: Send user input and UI updates via WebSocket
    App2->>App1: Send updates via WebSocket
    App1->>iPhone: Send updates via Bluetooth
```

# BluetoothConnector

Simple macOS app to connect a Bluetooth device and stream audio over websocket.

## Usage

To connect a device and stream audio:

```
BluetoothConnector --connect 00:00:00:00:00:00 --websocket wss://localhost:8080
```

This will:

- Connect to the device via Bluetooth 
- Stream audio from the device over a websocket connection
- Audio will be encoded using Opus codec

To stream audio back to device:

```
BluetoothConnector --connect 00:00:00:00:00:00 --websocket wss://localhost:8080 --stream-back
```

This will also stream any audio received over the websocket back to the device after decoding it.

A remote device can connect to the websocket endpoint to receive and send audio.

## Installation

```
swift package update
swift build
```

## Implementation

- Uses IOBluetooth to connect to devices
- Encodes Bluetooth audio with Opus  
- Sends and receives audio over websocket
- Decodes received audio back to raw format

## Notification Support

Can send desktop notifications on connect/disconnect.

```
BluetoothConnector --notify ...
``` 

## Automator Service

Includes an Automator workflow to bind a keyboard shortcut.
