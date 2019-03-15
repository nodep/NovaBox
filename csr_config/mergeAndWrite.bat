@echo off
psrmrg.py start.psr or.psr out.psr || EXIT /b
echo writing merged file to CSR
pscli -usb 1001034 merge out.psr
echo warm resetting CSR
pscli -usb 1001034 warm_reset
