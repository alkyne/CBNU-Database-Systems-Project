#-*- coding: utf-8 -*-
import mysql.connector
import sys

HOST = "172.16.139.131"
USER = "alkyne"
PASSWORD = "alkyne123!@#"

class Menu:

    def __init__(self):
        self.connect()
        self.options = {
            1 : self.showUsers,
            2 : self.showDesigners,
            3 : self.recentVisitUser,
            4 : self.showUsersByDesigner,
            5 : self.showSalaryByDesigner,
            6 : self.showWholePurchase,
            7 : self.showPurchaseByUser,
            8 : self.showPayByUser,
            9 : self.showMaxPayUser,
            10: self.showTreatmentHistoryByUser,
            11: self.showTreatmentHistoryByDesigner,
            12: self.showProductList,
            13: self.showPoints,
            99: self.byebye,
        }
        self.displayHeader()
        while True:
            self.runner() # run

    def displayHeader(self):
        print('-----------------------------------------------------------------')
        print('\t\t2019 Database Systems Project\n')
        print('\tComputer Science Department')
        print('\t\t\t\tat Chungbuk National University')
        print('-----------------------------------------------------------------')

    def displayMenu(self):
        print('-----------------------------------------------------------------')
        print(' 1. 등록된 회원 목록   \t\t2. 헤어 디자이너 목록')
        print(' 3. 가장 최근 방문한 회원\t4. 디자이너 별 담당 회원 목록 확인')
        print(' 5. 디자이너 별 급여 확인\t6. 전체 제품 구매 이력 확인')
        print(' 7. 회원 별 구입 현황 확인\t8. 회원 별 결제 이력 확인')
        print(' 9. 가장 돈 많이 쓴 회원 확인')
        print(' 10. 회원 별 미용 이력 확인')
        print(' 11. 디자이너 별 미용 이력 확인')
        print(' 12. 제품 목록 확인')
        print(' 13. 회원별 포인트 확인')
        print('\t\t\t\t99. quit')
        print('-----------------------------------------------------------------')

    def runner(self):
        # runner
        self.displayMenu() # print menu
        print("Input menu : ", end='')
        try:
            func = self.options.get(int(input()))

        except:
            print("nop")
            sys.exit(-1)
            
        if func:
            func()
        else:
            print("hey what ?!?") # invalid menu
        print()

    def connect(self):

        try:
            self.conn = mysql.connector.connect(
                host=HOST,
                user=USER,
                passwd=PASSWORD,
                port=3306,
                database="HairShop",
            )

        except:
            print("Failed to connect the MySQL server.")
            sys.exit(-1)
        
        #print("DB Connection ok")

    def showUsers(self):
        cursor = self.conn.cursor(dictionary=True)

        cursor.execute("select u.name, u.phone, u.register_date, u.point, d.name as dname from users u join designers d on d.no = u.designer_no")
        res = cursor.fetchall()

        print("== User list == ")
        for x in res:
            print("name : %s, phone : %s, register date : %s, point : %s, designer name : %s" % (x['name'], x['phone'], x['register_date'], x['point'], x['dname']))

    def showDesigners(self):
        cursor = self.conn.cursor(dictionary=True)

        cursor.execute("select * from designers")
        res = cursor.fetchall()

        print("== Designer list == ")
        for x in res:
            print("name : %s, phone : %s, start date : %s, class : %s" % (x['name'], x['phone'], x['start_date'], x['class']))
    
    def recentVisitUser(self):

        cursor = self.conn.cursor(dictionary=True)

        cursor.execute("select * from users where recent_visit = (select max(recent_visit) from users)")
        res = cursor.fetchall()

        print("== Most Recent Visit User == ")
        for x in res:
            print("name : %s, phone : %s, register date : %s, point : %s" % (x['name'], x['phone'], x['register_date'], x['point']))
        
    def showUsersByDesigner(self):
        cursor = self.conn.cursor(dictionary=True)

        cursor.execute("select d.name as dname, u.name as uname from designers d join users u on u.designer_no = d.no")
        res = cursor.fetchall()

        for x in res:
            print("designer : %s , user : %s" % (x['dname'], x['uname']))
    
    # 5
    def showSalaryByDesigner(self):
        cursor = self.conn.cursor(dictionary=True)

        cursor.execute("select d.name, s.price  from designers d join salary s on s.designer_no = d.no")
        res = cursor.fetchall()

        for x in res:
            print("designer : %s , salary : %s" % (x['name'], x['price']))

    # 6
    def showWholePurchase(self):
        cursor = self.conn.cursor(dictionary=True)

        cursor.execute("select name, product_name, purchase_date from purchase_history p join users u on p.user_no = u.no")
        res = cursor.fetchall()

        print ("== Whole product purchase list ==")
        for x in res:
            print("user : %s , product name : %s, purchase date : %s" % (x['name'], x['product_name'], x['purchase_date']))

    # 7
    def showPurchaseByUser(self):
        print ("User name : ", end='')
        userName = input()
        cursor = self.conn.cursor(dictionary=True)
        sql = "select name, product_name, purchase_date from purchase_history p join users u on p.user_no = u.no where name like '%%%s%%'" % (userName)
        cursor.execute(sql)
        res = cursor.fetchall()

        for x in res:
            print("user : %s , product name : %s, purchase date : %s" % (x['name'], x['product_name'], x['purchase_date']))

    # 8
    def showPayByUser(self):
        print ("User name : ", end='')
        userName = input()
        cursor = self.conn.cursor(dictionary=True)
        sql = "select name, price, purchase_method, pay_date from pay p join users u on p.user_no = u.no where name like '%%%s%%'" % (userName)
        cursor.execute(sql)
        res = cursor.fetchall()

        print ("\nUser %s Payment" % (userName))
        for x in res:
            print("user : %s , price : %s, method : %s, date : %s" % (x['name'], x['price'], x['purchase_method'], x['pay_date']))

    # 9
    def showMaxPayUser(self):
        cursor = self.conn.cursor(dictionary=True)
        sql = "select name,price from pay p join users u on u.no=p.user_no where price=(select max(price) from pay)"
        cursor.execute(sql)
        res = cursor.fetchall()

        print ("\n== Max Money Spend User ==")
        for x in res:
            print("user : %s , price : %s" % (x['name'], x['price']))

    # 10
    def showTreatmentHistoryByUser(self):
        print ("User name : ", end='')
        userName = input()
        cursor = self.conn.cursor(dictionary=True)
        sql = "select treatment_type, treatment_date, price from treatment_history t join users u on  t.user_no = u.no where u.name='%s'" % (userName)
        cursor.execute(sql)
        res = cursor.fetchall()

        print ("\n== User %s Treatment History == " % (userName))
        for x in res:
            print("treatment type : %s, date %s, price : %s" % (x['treatment_type'], x['treatment_date'], x['price']))

    # 11
    def showTreatmentHistoryByDesigner(self):
        print ("Designer name : ", end='')
        designerName = input()
        cursor = self.conn.cursor(dictionary=True)
        sql = "select treatment_type, treatment_date, price, u.name from treatment_history t join designers d on t.designer_no = d.no join users u on t.user_no=u.no where d.name='%s'" % (designerName)
        cursor.execute(sql)
        res = cursor.fetchall()

        print ("\n== Designer %s Treatment History == " % (designerName))
        for x in res:
            print("treatment type : %s, date %s, price : %s, user : %s" % (x['treatment_type'], x['treatment_date'], x['price'], x['name']))
    # 12
    def showProductList(self):

        cursor = self.conn.cursor(dictionary=True)
        cursor.execute("select * from products")
        res = cursor.fetchall()

        print ("\n== Whole Product List == ")
        for x in res:
            print("product name : %s, sold : %s, left : %s, price : %s"% (x['product_name'], x['sold_num'], x['left_num'], x['price']))

    # 13
    def showPoints(self):
        print ("User name : ", end='')
        userName = input()
        cursor = self.conn.cursor(dictionary=True)
        sql = "select * from users where name='%s'" % (userName)
        cursor.execute(sql)
        res = cursor.fetchall()

        print ("\n== User %s Point == " % (userName))
        for x in res:
            print("user : %s, point : %s" % (x['name'], x['point']) )


    def byebye(self):
        print("bye bye")
        sys.exit(0)


if __name__ == '__main__':

    Menu()
    