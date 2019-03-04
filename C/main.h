#include "A/index.h"
#include "B/lib.h"

class Mul{
	public:
		int a;
		int b;
		Mul(int aa, int bb): a(aa), b(bb){};
		int m(){return a*b;};
};
