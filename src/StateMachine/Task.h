//hi
#include <stdbool.h>

typedef struct Task{
	int (*isProcessorAvailable) (int cpu);
	int (*getConnection) (void);
};
