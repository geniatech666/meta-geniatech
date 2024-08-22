TARGET=rk_wifi_init

LDFLAGS= -lz


all: $(TARGET)
rk_wifi_init: rk_wifi_init.o
	# $(CC)  -o $@ $^ 
	$(CC) $(CFLAGS) -o $@ $^ 

TARGET=brcm_patchram_plus1
all: $(TARGET)
brcm_patchram_plus1: brcm_patchram_plus1.o
	$(CC) $(CFLAGS) -o $@ $^ 
	#$(CC)  -o $@ $^


clean:
	rm -f $(OBJS) $(TARGET)

