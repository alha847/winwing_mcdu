import hid

VENDOR_ID = 0x4098 
PRODUCT_ID = 0xbb36 # MCDU in captain setting

# Open device
device = hid.device()
device.open(VENDOR_ID, PRODUCT_ID)
print('Connected to Winwing MCDU {}\n'.format(PRODUCT_ID))

# Read data from device and print to command line
report = device.read(100)
print("Data read from MCDU = ")
print(report)


# Close device
device.close()