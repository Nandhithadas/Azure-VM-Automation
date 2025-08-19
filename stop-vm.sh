#!/bin/bash

resourceGroup="startstop-rg"
vmName="startupstop-vm"

# Get VM power status
status=$(az vm get-instance-view --name "$vmName" --resource-group "$resourceGroup" --query instanceView.statuses[1].code -o tsv)

if [[ "$status" == "PowerState/deallocated" ]]; then
    echo "VM is already stopped."
else
    echo "Stopping VM..."
    az vm deallocate --resource-group "$resourceGroup" --name "$vmName"
    echo "VM stopped successfully."
fi
