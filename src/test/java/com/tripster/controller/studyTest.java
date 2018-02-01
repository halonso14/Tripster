package com.tripster.controller;

import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.tripster.persistence.LikeDAO;
import com.tripster.persistence.PlanDAO;
import com.tripster.service.LikeService;


@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "file:src/main/webapp/WEB-INF/spring/**/*.xml" })
public class studyTest {
	
	
	

	@Test
	public void solution() throws Exception {
		int[] A = new int[10];
		for (int i =1; i<=10; i++) {
			A[i] = (int)(Math.random()*(1-(-1)+1))-1;
		}
		
		System.out.println(A);
		
		int[] sum = new int[A.length];
		int max=0,temp=1 ;
		
		sum[0]=A[0];
		for(int i=1; i<=A.length; i++) {
			if (sum[i-1]<0) {
				if(A[i]<0) {
					sum[i]=sum[i-1]+A[i];
				}else {
					sum[i]=A[i];
					if(max<temp) {max=temp;}
					temp=1;
					
				}
			}else if(sum[i-1]>=0){
				sum[i]=sum[i-1]+A[i];
				temp++;
			}
		}
		if(max<temp) {max=temp;}
	
	}
	int[] A = new int[length];
	for (int i =1; i<=length; i++) {
		A[i] = (int)(Math.random()*(1-(-1)+1))-1;
	}
	
	// 테스트케이스 만들기 
	@Test
	public static int[] testCase(int length) {
		int[] A = new int[length];
		for (int i =1; i<=length; i++) {
			A[i] = randomRange(-1,1);
		}
		return A;
	}
	// 랜덤배열 만들기 
	@Test
	public static int randomRange(int n1, int n2) {
		return (int)(Math.random()*(n2-n1+1))+n1;
	}
}
