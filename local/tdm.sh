#!/bin/bash
chmod -R a-x,a=rX,u+w "$drt"/phpmyadmin/
sleep 2h
chmod -R 000 "$drt"/phpmyadmin/
tmux kill-session
