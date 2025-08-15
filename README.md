# Service Configuration

Iniciar el servidor de Vault:
```bash
vault server --dev --dev-root-token-id="00000000-0000-0000-0000-000000000000"
```

Registrar los secretos en Vault:
```bash
vault kv put secret/api-gateway/prod @api-gateway.json
```