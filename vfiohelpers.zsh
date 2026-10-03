# gpu="0000:03:00.0"
# aud="0000:03:00.1"
# ssd="0000:17:00.0"
# gpu_vd="$(cat /sys/bus/pci/devices/$gpu/vendor) $(cat /sys/bus/pci/devices/$gpu/device)"
# aud_vd="$(cat /sys/bus/pci/devices/$aud/vendor) $(cat /sys/bus/pci/devices/$aud/device)"
# ssd_vd="$(cat /sys/bus/pci/devices/$ssd/vendor) $(cat /sys/bus/pci/devices/$ssd/device)"
#
# function bind_vfio {
# 	echo "$gpu" > "/sys/bus/pci/devices/$gpu/driver/unbind"
# 	echo "$aud" > "/sys/bus/pci/devices/$aud/driver/unbind"
# 	echo "$ssd" > "/sys/bus/pci/devices/$ssd/driver/unbind"
# 	echo "$gpu_vd" > /sys/bus/pci/drivers/vfio-pci/new_id
# 	echo "$aud_vd" > /sys/bus/pci/drivers/vfio-pci/new_id
# 	echo "$ssd_vd" > /sys/bus/pci/drivers/vfio-pci/new_id
# }
#
# function unbind_vfio {
# 	echo "$gpu_vd" > "/sys/bus/pci/drivers/vfio-pci/remove_id"
# 	echo "$aud_vd" > "/sys/bus/pci/drivers/vfio-pci/remove_id"
# 	echo "$ssd_vd" > "/sys/bus/pci/drivers/vfio-pci/remove_id"
# 	echo 1 > "/sys/bus/pci/devices/$gpu/remove"
# 	echo 1 > "/sys/bus/pci/devices/$aud/remove"
# 	echo 1 > "/sys/bus/pci/devices/$ssd/remove"
# 	echo 1 > "/sys/bus/pci/rescan"
# }
