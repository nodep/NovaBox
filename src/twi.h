#pragma once

#define TWSR_MASK				0xF8
#define TWSR_START_TX_OK		0x08
#define TWSR_RSTART_TX_OK		0x10
#define TWSR_SLA_W_ACK			0x18
#define TWSR_SLA_W_NAK			0x20
#define TWSR_BYTE_TX_ACK		0x28
#define TWSR_BYTE_TX_NAK		0x30
#define TWSR_ARB_LOST			0x38

#define twi_is_sla_w_ack()		((TWSR & TWSR_MASK) == TWSR_SLA_W_ACK)
#define twi_is_sla_w_nak()		((TWSR & TWSR_MASK) == TWSR_SLA_W_NAK)
#define twi_is_byte_tx_ack()	((TWSR & TWSR_MASK) == TWSR_BYTE_TX_ACK)
#define twi_is_byte_tx_nak()	((TWSR & TWSR_MASK) == TWSR_BYTE_TX_NAK)


void twi_init(void);
void twi_start(void);
void twi_stop(void);
bool twi_write(uint8_t u8data);
uint8_t twi_read(bool ack);
