package org.crm.entity;

public class Calc1 {

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		double N = 5;

		System.out.println(fun(N));
		System.out.println(fun1(N));
		System.out.println(fun2(N));
	}

	// ����
	public static double fun(double N) {
		int j = 0;
		for (int i = 1; i <= N; i++) {
			j += i;
		}
		return j;
	}

	// �ݹ�
	public static double fun1(double N) {

		if (N == 1)
			return 1;
		return fun1(N - 1) + N;

	}

	// �Ȳ����й�ʽ
	public static double fun2(double N) {
		return (N * 0.5) * (N + 1);
	}
}
