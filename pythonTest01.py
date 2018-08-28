#20180828_Tue～

#これでコメント
"""defがJSでいうfunctionにあたる"""
def test01():
	asano = "あさの"
	return asano
#コンソールに「あさの」と出る
#print(test01())

def test02(a, b):
	return a+b, a*b

def test03():
	aa, bb = test02(5,10)
	print(aa, bb)

#15 50となる
#test03()
