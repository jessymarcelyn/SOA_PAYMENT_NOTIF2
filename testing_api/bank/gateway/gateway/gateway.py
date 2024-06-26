from nameko.rpc import RpcProxy
from nameko.web.handlers import http
import json
import datetime 
from werkzeug.wrappers import Response
import requests

class GatewayService:
    name = 'gateway'

     #BANK BCA
    BBCA_rpc = RpcProxy('BankBCA_service')
    
    @http('GET', '/BCA/<string:noTelp>')
    def getVABCA(self, request, noTelp):
        exist = self.BBCA_rpc.get_byNoTelp(noTelp)
        va = ''
        if exist:
            va += '122'
            va  += noTelp
            # va.append(str(noTelp))
            return Response(json.dumps(va), status=200, mimetype='application/json')
        else:
            return Response(json.dumps('No Bank Account is found with this phone number'), status=404, mimetype='application/json')
        
    @http('POST', '/BCA')
    def createBankAccBCA(self, request):
        try:
            data = json.loads(request.get_data(as_text=True))
            nama = data.get('nama')
            no_rek = data.get('no_rek')
            pin = data.get('pin')
            saldo = data.get('saldo')
            no_telp = data.get('no_telp')
            create = self.BBCA_rpc.createBankAcc(nama, no_rek, pin, saldo, no_telp)
            return 200, json.dumps(create)
        except Exception as e:
            return 500, json.dumps({"error": str(e)})
        
    @http('GET', '/BCA/VA/<string:VA>/pin/<string:pin>')
    def CheckPinBCA(self, request, VA, pin):
        no = VA[3:]
        check = self.BBCA_rpc.CheckPin(no, pin)
        if check: 
            return Response(json.dumps('Pembayaran Berhasil'), status=200, mimetype='application/json')
        else:
            return Response(json.dumps('Wrong VA or PIN Please try again'), status=404, mimetype='application/json')

    #GET status berdasarkan id_transaksi
    @http('GET', '/transBCA/status/<int:idTrans>')
    def get_status_byIDTransTBCA(self, request, idTrans):
        exist = self.BBCA_rpc.get_status_byIDTrans(idTrans)
        if exist:
            return Response(json.dumps(exist), status=200, mimetype='application/json')
        else:
            return Response(json.dumps('No Transaction found with this ID'), status=404, mimetype='application/json')
        
    #GET berdasarkan id_transaksi
    @http('GET', '/transBCA/<int:idTrans>')
    def get_byIDTransTBCA(self, request, idTrans):
        exist = self.BBCA_rpc.get_byIDTrans(idTrans)
        if exist:
            return Response(json.dumps(exist), status=200, mimetype='application/json')
        else:
            return Response(json.dumps('No Transaction found with this ID'), status=404, mimetype='application/json')
        
    #GET untuk cek timestamp > 2 menit berdasarkan id_trans
    @http('GET', '/transBCA/timestamp/<int:idTrans>')
    def get_timestamp_byIDTransTBCA(self, request, idTrans):
        exist = self.BBCA_rpc.get_timestamp_byIDTrans(idTrans)
        if exist:
            return Response(json.dumps(exist), status=200, mimetype='application/json')
        else:
            return Response(json.dumps('No Transaction found with this ID'), status=404, mimetype='application/json')
        
    #POST create (masukin no_telp, nominal, status = ongoing, VA) di tabel transaksi transfer bank
    @http('POST', '/transBCA')
    def create_transTBCA(self, request):
        try:
            data = json.loads(request.get_data(as_text=True))
            no_telp = data.get('no_telp') #BAKALAN DIGANTI SAMA API GET NO_TELP NYA 
            nominal = data.get('nominal')
            # va = data.get('VA')
            api_url = f'http://54.164.221.231:8009/BCA/{no_telp}'
            Response = requests.get(api_url)
            if Response.status_code == 200:
                va = Response.json()
                transaksi = self.BBCA_rpc.create_trans(
                    no_telp, nominal, va
                )
                return 200, json.dumps(transaksi)
            else: 
                return Response(json.dumps('Wrong phone number'), status=404, mimetype='application/json')
        except Exception as e:
            return 500, json.dumps({"error": str(e)})
        
    #PUT ada pembayaran jadi update status = success
    @http('PUT', '/transBCA/<int:idTrans>')
    def pay_transTBCA(self, request, idTrans):
        exist = self.BBCA_rpc.get_byIDTrans(idTrans)
        status = "succes"
        if exist :
            api_url = f'http://54.164.221.231:8009/Tpembayaran/pesanan/{idTrans}/status/{status}'
            # api_url = f'http://localhost:8000/Tpembayaran/pesanan/{idTrans}'
            # api_url = f'http://127.0.0.1:8000/Tpembayaran/pesanan/{idTrans}'
            payload = {
                'jenis': 'Transfer Bank',
                'nama_penyedia': 'BCA',
                'status' : 'success'
            }       
            response = requests.put(api_url, json=payload)
            if response.status_code == 200:
                pay = self.BBCA_rpc.pay_trans(idTrans)
                return Response(json.dumps(pay), status=200, mimetype='application/json')
            else:
                return Response(json.dumps({'error': 'Failed to update transaction'}), status=response.status_code, mimetype='application/json')
        else:
            return Response(json.dumps('No Transaction found with this ID'), status=404, mimetype='application/json')
        
    
    #BANK MANDIRI
    BMandiri_RPC = RpcProxy('BankMandiri_service')
    
    @http('GET', '/Mandiri/<string:noTelp>')
    def getVAMandiri(self, request, noTelp):
        exist = self.BMandiri_RPC.get_byNoTelp(noTelp)
        va = ''
        if exist:
            va += '126'
            va  += noTelp
            # va.append(str(noTelp))
            return Response(json.dumps(va), status=200, mimetype='application/json')
        else:
            return Response(json.dumps('No Bank Account is found with this phone number'), status=404, mimetype='application/json')
        
    @http('POST', '/Mandiri')
    def createBankAccMandiri(self, request):
        try:
            data = json.loads(request.get_data(as_text=True))
            nama = data.get('nama')
            no_rek = data.get('no_rek')
            pin = data.get('pin')
            saldo = data.get('saldo')
            no_telp = data.get('no_telp')
            create = self.BMandiri_RPC.createBankAcc(nama, no_rek, pin, saldo, no_telp)
            return 200, json.dumps(create)
        except Exception as e:
            return 500, json.dumps({"error": str(e)})
        
    @http('GET', '/Mandiri/VA/<string:VA>/pin/<string:pin>')
    def CheckPinMandiri(self, request, VA, pin):
        no = VA[3:]
        check = self.BMandiri_RPC.CheckPin(no, pin)
        if check: 
            return Response(json.dumps('Pembayaran Berhasil'), status=200, mimetype='application/json')
        else:
            return Response(json.dumps('Wrong VA or PIN Please try again'), status=404, mimetype='application/json')

    #GET status berdasarkan id_transaksi
    @http('GET', '/transMandiri/status/<int:idTrans>')
    def get_status_byIDTransTMandiri(self, request, idTrans):
        exist = self.BMandiri_RPC.get_status_byIDTrans(idTrans)
        if exist:
            return Response(json.dumps(exist), status=200, mimetype='application/json')
        else:
            return Response(json.dumps('No Transaction found with this ID'), status=404, mimetype='application/json')
        
    #GET berdasarkan id_transaksi
    @http('GET', '/transMandiri/<int:idTrans>')
    def get_byIDTransTMandiri(self, request, idTrans):
        exist = self.BMandiri_RPC.get_byIDTrans(idTrans)
        if exist:
            return Response(json.dumps(exist), status=200, mimetype='application/json')
        else:
            return Response(json.dumps('No Transaction found with this ID'), status=404, mimetype='application/json')
        
    #GET untuk cek timestamp > 2 menit berdasarkan id_trans
    @http('GET', '/transMandiri/timestamp/<int:idTrans>')
    def get_timestamp_byIDTransTMandiri(self, request, idTrans):
        exist = self.BMandiri_RPC.get_timestamp_byIDTrans(idTrans)
        if exist:
            return Response(json.dumps(exist), status=200, mimetype='application/json')
        else:
            return Response(json.dumps('No Transaction found with this ID'), status=404, mimetype='application/json')
        
    #POST create (masukin no_telp, nominal, status = ongoing, VA) di tabel transaksi transfer bank
    @http('POST', '/transMandiri')
    def create_transTMandiri(self, request):
        try:
            data = json.loads(request.get_data(as_text=True))
            no_telp = data.get('no_telp')
            nominal = data.get('nominal')
            api_url = f'http://54.164.221.231:8009/Mandiri/{no_telp}'
            Response = requests.get(api_url)
            if Response.status_code == 200:
                va = Response.json()
                transaksi = self.BMandiri_RPC.create_trans(
                    no_telp, nominal, va
                )
                return 200, json.dumps(transaksi)
            else: 
                return Response(json.dumps('Wrong phone number'), status=404, mimetype='application/json')
        except Exception as e:
            return 500, json.dumps({"error": str(e)})
        
    #PUT ada pembayaran jadi update status = success
    @http('PUT', '/transMandiri/<int:idTrans>')
    def pay_transTMandiri(self, request, idTrans):
        exist = self.BMandiri_RPC.get_byIDTrans(idTrans)
        status = "success"
        if exist :
            api_url = f'http://54.164.221.231:8009/Tpembayaran/pesanan/{idTrans}/status/{status}'
            # api_url = f'http://localhost:8000/Tpembayaran/pesanan/{idTrans}'
            payload = {
                'jenis': 'Transfer Bank',
                'nama_penyedia': 'BCA',
                'status' : 'success'
            }       
            response = requests.put(api_url, json=payload)
            if response.status_code == 200:
                pay = self.BMandiri_RPC.pay_trans(idTrans)
                return Response(json.dumps(pay), status=200, mimetype='application/json')
            else:
                return Response(json.dumps({'error': 'Failed to update transaction'}), status=response.status_code, mimetype='application/json')
        else:
            return Response(json.dumps('No Transaction found with this ID'), status=404, mimetype='application/json')
        