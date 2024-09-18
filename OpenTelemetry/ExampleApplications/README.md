# Example Applications

```puml
card "**Client**" as usr #EEF
component "Reverse Proxy" <<dotnet>> as proxy #EFF
note left of proxy: SDK Instrumentation
component "Apps" <<dotnet>> as app #EFF
note left of app: Auto Instrumentation
component "Coin Toss" <<python>> as coin #EFE
note right of coin: SDK Instrumentation
component "Hello" <<python>> as hello #EFE
note right of hello: Auto Instrumentation

usr ..> proxy
proxy --> app
proxy -> coin
app -> hello
```
