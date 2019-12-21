/*
* Mouserial.c
*
* Created: 6/23/2019 7:44:48 PM
* Author : Matthew
*/

#include <avr/io.h>
#include "mouserial.h"


int main(void)
{
	/* Replace with your application code */
	while (1)
	{
	}
}

static mouse_state_t state;

static inline void resetcmdpending() {
	mouserial->status_cmd.status = 0x00;
}

static inline void servicecmd() {
	switch (mouserial->status_cmd.cmd) {
		case (int)CMD_SET_X1:
			state.x1 = mouserial->argres.word;
			if (state.x > state.x1) { state.x = state.x1; }
			return resetcmdpending();
		case (int)CMD_SET_Y1:
			state.y1 = mouserial->argres.word;
			if (state.y > state.x1) { state.y = state.y1; }
			return resetcmdpending();
		case (int)CMD_SET_X0:
			state.x0 = mouserial->argres.word;
			if (state.x < state.x0) { state.x = state.x0; }
			return resetcmdpending();
		case (int)CMD_SET_Y0:
			state.y0 = mouserial->argres.word;
			if (state.y < state.y0) { state.y = state.y0; }
			return resetcmdpending();
		case (int)CMD_SET_X:
			state.x = mouserial->argres.word;
			return resetcmdpending();
		case (int)CMD_SET_Y:
			state.y = mouserial->argres.word;
			return resetcmdpending();
		case (int)CMD_GET_X:
			mouserial->argres.word = state.x;
			return resetcmdpending();
		case (int)CMD_GET_Y:
			mouserial->argres.word = state.y;
			return resetcmdpending();
		case (int)CMD_HOMEMOUSE:
			state.x = state.x0;
			state.y = state.y0;
			return resetcmdpending();
		case (int)CMD_CLEARMOUSE:
			state.x = 0;
			state.y = 0;
			//FIXME: what about when x0 > 0 or y0 > 0?
			return resetcmdpending();
		case (int)CMD_GETIRQSTATUS: break;
		case (int)CMD_INITVBLIRQ:
			 
			return;
		case (int)CMD_INITMOUSE:
			state.x = 0;
			state.y = 0;
			state.x0 = 0;
			state.y0 = 0;
			state.x1 = 1023;
			state.y1 = 1023;
			//FIXME: anything else required to reset hardware?
			return resetcmdpending();
		case (int)CMD_NONE: return resetcmdpending();
	}
}

