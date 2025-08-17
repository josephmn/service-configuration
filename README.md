# Service Configuration

Iniciar el servidor de Vault:
```bash
vault server --dev --dev-root-token-id="00000000-0000-0000-0000-000000000000"
```

Registrar los secretos en Vault:
```bash
# api gateway
vault kv put secret/api-gateway/dev @api-gateway.json
vault kv put secret/api-gateway/cert @api-gateway.json
vault kv put secret/api-gateway/prod @api-gateway.json

#customer
vault kv put secret/msv-customer/dev @msv-customer.json
vault kv put secret/msv-customer/cert @msv-customer.json
vault kv put secret/msv-customer/prod @msv-customer.json

# Student
vault kv put secret/student/dev @student-dev.json
vault kv put secret/student/cert @student-dev.json
vault kv put secret/student/prod @student-prod.json
```