TARGET=rk_wifi_init

LDFLAGS= -lz


all: $(TARGET)
rk_wifi_init: rk_wifi_init.o
	# $(CC)  -o $@ $^ 
	$(CC) $(CFLAGS) -o $@ $^ 

#TARGET=brcm_patchram_plus1
#all: $(TARGET)
#brcm_patchram_plus1: brcm_patchram_plus1.o
#	$(CC) $(CFLAGS) -o $@ $^ 
	#$(CC)  -o $@ $^

TARGET=rtk_hciattach 

all: $(TARGET)
rtk_hciattach: hciattach.o hciattach_rtk.o hciattach_h4.o rtb_fwc.o
#rtk_hciattach: $(OBJS)
	$(CC) $(CFLAGS) -o $@ $^
#	 $(CC) -o rtk_hciattach $(OBJS)
#%.o: %.c
#	 $(CC) $(CFLAGS) -c $< -o $@


clean:
	rm -f $(OBJS) $(TARGET)
