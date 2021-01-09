import requests
from sqlalchemy import exc
import json
import pandas as pd
import connection

def treatment(table, money, numb_code):
    table[money] = table[money].str.replace(',','')
    table[money] = pd.to_numeric(table[money])
    table[numb_code] = table[numb_code].apply(pd.to_numeric)

def insertData (table, table_name):
    for i in range(len(table)):
        try:
            table.iloc[i:i+1].to_sql(table_name, connection.conn, if_exists='append', index=False)
        except exc.IntegrityError:
            print("Uma linha possui id repetido, passando para o próximo!")
            pass

def object_data():
    response = requests.get("http://dataeng.quero.com:5000/caged-data", timeout=5)
    col_salario = 'salario'
    col_numbers = ['categoria', 'cbo2002_ocupacao', 'competencia', 'fonte', 'grau_de_instrucao', 
                    'horas_contratuais', 'id', 'idade', 'ind_trab_intermitente', 'ind_trab_parcial', 'indicador_aprendiz', 'municipio', 'raca_cor',
                    'regiao', 'saldo_movimentacao', 'sexo', 'subclasse', 'tam_estab_jan', 'tipo_de_deficiencia', 'tipo_empregador',
                    'tipo_estabelecimento', 'tipo_movimentacao', 'uf']

    df = pd.json_normalize(response.json()["caged"])
    treatment(df, col_salario, col_numbers)
    df.columns = ['categoria', 'ocupacao', 'competencia', 'fonte', 'grau_de_instrucao', 'horas_contratuais', 'id', 'idade', 'ind_trab_intermitente', 'ind_trab_parcial', 
                    'indicador_aprendiz', 'municipio', 'raca_cor', 'regiao', 'salario', 'saldo_movimentacao', 'secao', 'sexo', 'subclasse', 'tam_estab_jan', 
                    'tipo_de_deficiencia', 'tipo_empregador', 'tipo_estabelecimento', 'tipo_movimentacao', 'uf']

    insertData(df, 'candidate_data')
    connection.conn.close()

try:
    object_data()
    print("Dados cadastrados com sucesso!")
except requests.exceptions.HTTPError as errh:
    print("Http Error: ", errh)

except requests.exceptions.ConnectionError as errc:
    print("Connection Error:", errc)

except requests.exceptions.Timeout:
    object_data()

except requests.exceptions.RequestException as err:
    print ("Something got wrong: ", err)



