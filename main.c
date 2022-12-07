#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <time.h>
#include <unistd.h>

#include <ptk.h>

static void process (int n, const char *const *list)
{
	int d, i, k, l, m, y;
	char sep[2];
	long j;

	for (i = 0; i < n; ++i) {
		l = strlen (list[i]);
		k = strspn (list[i], "0123456789");
		if (k < l) {
			sep[0] = list[i][k];
			sep[1] = '\0';
			j = parse_ymd (list[i], sep, &y, &m, &d);
		} else {
			j = atol (list[i]);
			caldat (j, &y, &m, &d);
		}
		(void) printf ("%ld  %4d/%02d/%02d\n", j, y, m, d);
	}
}

static int scan (size_t size, char **text, int count, const char ***list)
{
	char line[256];
	const char *temp;
	size_t length;
	int n;

	if (fgets (line, sizeof (line), stdin) == line) {
		temp = trim (line);
		length = (strlen (temp) | 7) + 1;
		n = scan (size + length, text, count + 1, list);
		(*list)[count] = strncpy (*text + size, temp, length);
	} else if ((size > 0) && (count > 0)) {
		n = count;
		*text = ptk_malloc (__FILE__, __LINE__, size);
		*list = (const char **) ptk_calloc (__FILE__, __LINE__, count, sizeof (**list));
	} else {
		n = 0;
		*text = NULL;
		*list = NULL;
	}
	return n;
}

int main (int argc, char *const *argv)
{
	int n;
	char *text;
	const char **list;
	time_t lt;
	struct tm *tm;
	char temp[64];
	const char *tmp;

	if (optind < argc) {
		process (argc - optind, (const char *const *) argv + optind);
	} else {
		n = scan (0, &text, 0, &list);
		if (n > 0) {
			process (n, list);
			free (text);
			free (list);
		} else {
			lt = time (NULL);
			tm = localtime (&lt);		
			(void) sprintf (temp, "%d/%d/%d", tm->tm_year + 1900, tm->tm_mon + 1, tm->tm_mday);
			tmp = temp;
			process (1, &tmp);
		}
	}
	return 0;
}
