create service principal
```
az ad sp create-for-rbac --name "maxam-dev" --role contributor --scopes /subscriptions/df87dc69-fe6e-4055-a2af-1eab200c4652/resourceGroups/maxam-dev --sdk-auth
```
create secret for azure credentials dev
create secret for github PAT
create global management group
create custom role for register resource providers allow
    "Microsoft.DocumentDB/register/action",
    "Microsoft.OperationalInsights/register/action",
    "Microsoft.ApiManagement/register/action"
