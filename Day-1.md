# Day 1

#### 面试时，考官出的算法：生成一组随机数，顺序排序输出

```c
#include <stdio.h>
#include <stdlib.h>
#include <time.h>

int main() {
  int a[20];
  int i,j,tmp;
  srand((unsigned)time(NULL));
  // 赋值与排序算法必须分开；之前调试错误的问题是由此导致的
  for(i=0;i<20;i++)
  {
    a[i] = rand()%100;
    printf("%d\n",a[i]);

  }
  printf("------------------\n");
  for(i=0;i<20;i++){
   for(j=i+1;j<20;j++)
    {
      if(a[i]>a[j])
      {
        tmp = a[j];
        a[j] = a[i];
        a[i] = tmp;
      }
   }
    printf("%d\n",a[i]);
  }
}
```
