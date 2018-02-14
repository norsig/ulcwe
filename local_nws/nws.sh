#!/bin/bash
"$rse"
certbot --nginx -d "$domain" -d www."$domain"
"$rse"
