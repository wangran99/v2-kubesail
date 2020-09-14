#!/bin/sh
# V2Ray new configuration
date
cat <<-EOF > /etc/v2ray/config.json
{
    "inbounds": [
        {
            "protocol": "vmess",
            "port": 8080,
            "settings": {
                "clients": [
                    {
                        "alterId": 0,
                        "id": "$UUID"
                    }
                ]
            },
            "streamSettings": {
                "network": "ws",
                "wsSettings": {
                    "path": "/helloworld"
                }
            }
        }
    ],
    "outbounds": [
        {
            "tag": "direct",
            "protocol": "freedom"
        }
    ]
}
EOF

# Run V2Ray
/usr/bin/v2ray/v2ray -config=/etc/v2ray/config.json
