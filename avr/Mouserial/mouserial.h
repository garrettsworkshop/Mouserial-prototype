/*
 * mouserial.h
 *
 * Created: 6/23/2019 7:45:46 PM
 *  Author: Matthew
 */ 

#include <stdint.h>

#ifndef MOUSERIAL_H_
#define MOUSERIAL_H_

typedef char bool_t;
static const bool_t true = 1;
static const bool_t false = 0;

typedef unsigned char status_t;

typedef unsigned char cmd_t;
static const cmd_t CMD_SET_X1 = 0x1F;
static const cmd_t CMD_SET_Y1 = 0x1E;
static const cmd_t CMD_SET_X0 = 0x1D;
static const cmd_t CMD_SET_Y0 = 0x1C;
static const cmd_t CMD_GET_X1 = 0x1B;
static const cmd_t CMD_GET_Y1 = 0x1A;
static const cmd_t CMD_GET_X0 = 0x19;
static const cmd_t CMD_GET_Y0 = 0x18;
static const cmd_t CMD_SET_X = 0x17;
static const cmd_t CMD_SET_Y = 0x16;
static const cmd_t CMD_GET_X = 0x15;
static const cmd_t CMD_GET_Y = 0x14;
static const cmd_t CMD_HOMEMOUSE = 0x05;
static const cmd_t CMD_CLEARMOUSE = 0x04;
static const cmd_t CMD_GETIRQSTATUS = 0x03;
static const cmd_t CMD_INITVBLIRQ = 0x02;
static const cmd_t CMD_INITMOUSE = 0x01;
static const cmd_t CMD_NONE = 0x00;

typedef struct mode {
	char pad:4;				// 7:4
	bool_t irq_on_vbl:1;	// 3
	bool_t irq_on_btn:1;	// 2
	bool_t irq_on_mov:1;	// 1
	bool_t mouse_enabled:1;	// 0
} mode_t;

typedef struct irqstatus {
	bool_t b0cur:1;			// 7
	bool_t b0prev:1;		// 6
	bool_t moved:1;			// 5
	bool_t b1cur:1;			// 4
	bool_t vbl_irq:1;		// 3
	bool_t btn_irq:1;		// 2
	bool_t mov_irq:1;		// 1
	bool_t b1prev:1;		// 0
} irqstatus_t;

typedef union argres {
	struct {
		uint8_t hi;
		uint8_t lo;
	};
	uint16_t word;
} argres_t;

typedef struct mouserial_avrregs {
	char pad1[3];
	char video;
	char pad0[9];
	argres_t argres;
	union { status_t status; cmd_t cmd; } status_cmd;
} mouserial_avrregs_t;
static mouserial_avrregs_t* const mouserial = (mouserial_avrregs_t*)0x8000;

typedef struct mouse_state {
	int16_t x, x0, x1;
	int16_t y, y0, y1;
	mode_t mode;
} mouse_state_t;

#endif /* MOUSERIAL_H_ */