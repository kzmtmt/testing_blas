include ../Makefile.in

TARGET	= testing_sgemm

.PHONY: all clean test

all: $(TARGET)

$(TARGET): $(TARGET).c
	$(CC) $(CFLAGS) $< $(LDFLAGS) -o $@

clean:
	$(RM) $(TARGET)

test: all
	./$(TARGET) 0 0 0 1024 64 1
