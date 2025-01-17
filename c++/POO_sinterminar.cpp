#include <iostream>
using namespace std;

int find_if_even(int *p){
	
	for(int i=0;i<3;i++) { 
		if(*(p+i)%2==0){
			return *p;
		}
	}
	
	return 0;
}


int main() {
	
	int *q = new int[3];
	
	for(int i=0;i<3;i++) { 
		cin >> *(q+i); 
	}
	int *t=nullptr;
	
	*t=find_if_even(*q);
	cout << t;
	
	delete[] q;
	
	return 0;
}

