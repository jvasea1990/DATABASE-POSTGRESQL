import psycopg2
import random

end=10

def create_list (rand_start, rand_stop):
    list_name=list()
    i=1
    global end
    
    while i<=end:
        if (rand_stop-rand_start)<end-i:
            print ("too few values for randoming")
            break
        product = random.randint(rand_start,rand_stop)
        if product not in list_name:
            list_name.append(product)
            # print (product_id, end=" ")
            i+=1
        else:
            continue
    return list_name

def print_list (list_name):
    if len(list_name)>0:
        print (list_name)
    
product_id_list=create_list(1,100)
product_price_list=create_list(0, 1000)
product_quantity=create_list(0, 500)

print_list(product_id_list)
print_list(product_price_list)
print_list(product_quantity)

conn= psycopg2.connect(database="e-shop", user="postgres", password="C2009/*")


for i in range (0, 10):
    sql= f"""
    Begin;
    INSERT INTO "money" VALUES ({product_id_list[i]}, {int(product_price_list[i]*100)}, 'EUR');
    INSERT INTO "products" VALUES ({product_id_list[i]}, 'Product {product_id_list[i]}', {product_id_list[i]});
    INSERT INTO "stock" VALUES (2{product_id_list[i]}, {product_id_list[i]}, {product_quantity[i]});
    COMMIT;
    """
cursor = conn.cursor()

cursor.execute(sql)


view = """
SELECT * from products;
"""
cursor_view= conn.cursor()
cursor_view.execute(view)
result=cursor_view.fetchall()

print (result)