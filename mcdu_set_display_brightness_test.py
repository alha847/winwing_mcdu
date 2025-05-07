import hid

VENDOR_ID = 0x4098 
PRODUCT_ID = 0xbb36 

# Open
device = hid.device()
device.open(VENDOR_ID, PRODUCT_ID)
print('Connected to Winwing MCDU {}\n'.format(PRODUCT_ID))

# Set brightness -> Tested successfully
# Something needs to be shown on the display, otherwise the brightness change will not be visible
bright_val = 255 # 0...255
device.write([0x02,0x32,0xbb,0x00,0x00,0x03,0x49,0x01,bright_val,00,00,00,00,00])

# Close
device.close()