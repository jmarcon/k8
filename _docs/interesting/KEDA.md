# <img src="https://keda.sh/img/logos/keda-horizontal-color.png" alt="Keda" width="150"/>

<!--
```bash
# :::^.     .::::^:     :::::::::::::::    .:::::::::.                   .^.
# 7???~   .^7????~.     7??????????????.   :?????????77!^.              .7?7.
# 7???~  ^7???7~.       ~!!!!!!!!!!!!!!.   :????!!!!7????7~.           .7???7.
# 7???~^7????~.                            :????:    :~7???7.         :7?????7.
# 7???7????!.           ::::::::::::.      :????:      .7???!        :7??77???7.
# 7????????7:           7???????????~      :????:       :????:      :???7?5????7.
# 7????!~????^          !77777777777^      :????:       :????:     ^???7?#P7????7.
# 7???~  ^????~                            :????:      :7???!     ^???7J#@J7?????7.
# 7???~   :7???!.                          :????:   .:~7???!.    ~???7Y&@#7777????7.
# 7???~    .7???7:      !!!!!!!!!!!!!!!    :????7!!77????7^     ~??775@@@GJJYJ?????7.
# 7???~     .!????^     7?????????????7.   :?????????7!~:      !????G@@@@@@@@5??????7:
# ::::.       :::::     :::::::::::::::    .::::::::..        .::::JGGGB@@@&7:::::::::
#                                                                       G@@#~
#                                                                       P@B^
#                                                                     :&G:
#                                                                    .&@^
#                                                                     
# .Kubernetes Event-driven Autoscaling (KEDA) - Application autoscaling made simple.
```
-->

[Official Documentation](https://keda.sh/)

Get started by deploying Scaled Objects to your cluster:

- Information about Scaled Objects : [Concepts](https://keda.sh/docs/latest/concepts/)
- Samples: [Docs](https://github.com/kedacore/samples)

Get information about the deployed ScaledObjects:

`kubectl get scaledobject [--namespace <namespace>]`

Get details about a deployed ScaledObject:

`kubectl describe scaledobject <scaled-object-name> [--namespace <namespace>]`

Get information about the deployed ScaledObjects:

`kubectl get triggerauthentication [--namespace <namespace>]`

Get details about a deployed ScaledObject:

`kubectl describe triggerauthentication <trigger-authentication-name> [--namespace <namespace>]`

Get an overview of the Horizontal Pod Autoscalers (HPA) that KEDA is using behind the scenes:

`kubectl get hpa [--all-namespaces] [--namespace <namespace>]`

Learn more about KEDA:

- [Documentation](https://keda.sh/)
- [Support](https://keda.sh/support/)
- [File an issue](https://github.com/kedacore/keda/issues/new/choose)
