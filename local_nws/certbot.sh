#!/bin/bash
certbot --nginx -d "$domain" -d www."$domain"
"$rse"
