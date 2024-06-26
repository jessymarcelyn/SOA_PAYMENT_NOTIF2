from nameko.rpc import RpcProxy
from nameko.web.handlers import http
import json
import datetime 
from werkzeug.wrappers import Response
import requests

class GatewayService:
    name = 'gateway'

    #GOPAY
    gopay_rpc = RpcProxy('gopay_service')

    @http('POST', '/gopay') #cek nomor telepon, return idtransaksi
    def post_pembayaran_gopay(self, request):
        data = json.loads(request.get_data(as_text=True))
        pembayaran = self.gopay_rpc.insert_transaksi(data['no_telp'], data['nominal'])
        return json.dumps(pembayaran)
         
    @http('GET', '/gopay/status/<string:id_transaksi>') #return status pembayaran
    def get_status_pembayaran_by_id_transaksi_gopay(self, request, id_transaksi):
        pembayaran = self.gopay_rpc.get_status_transaksi(id_transaksi)
        return json.dumps(pembayaran)
    
    @http('PUT', '/gopay/pembayaran') #check pin dan check saldo
    def bayar_gopay(self, request):
        data = json.loads(request.get_data(as_text=True))
        pembayaran = self.gopay_rpc.bayar(data['id_transaksi'], data['pin'])
        return json.dumps(pembayaran)
    
    @http('GET', '/gopay/timestamp/<string:id_transaksi>')
    def get_timestamp_by_id_transaksi_gopay(self, request, id_transaksi):
        timestamp = self.gopay_rpc.get_timestamp(id_transaksi)
        return json.dumps(timestamp)
    
    # OVO
    ovo_rpc = RpcProxy('ovo_service')

    @http('POST', '/ovo') #cek nomor telepon, return idtransaksi
    def post_pembayaran_ovo(self, request):
        data = json.loads(request.get_data(as_text=True))
        pembayaran = self.ovo_rpc.insert_transaksi(data['no_telp'], data['nominal'])
        return json.dumps(pembayaran)
         
    @http('GET', '/ovo/status/<string:id_transaksi>') #return status pembayaran
    def get_status_pembayaran_by_id_transaksi_ovo(self, request, id_transaksi):
        pembayaran = self.ovo_rpc.get_status_transaksi(id_transaksi)
        return json.dumps(pembayaran)
    
    @http('PUT', '/ovo/pembayaran') #check pin dan check saldo
    def bayar_ovo(self, request):
        data = json.loads(request.get_data(as_text=True))
        pembayaran = self.ovo_rpc.bayar(data['id_transaksi'], data['pin'])
        return json.dumps(pembayaran)
    
    @http('GET', '/ovo/timestamp/<string:id_transaksi>')
    def get_timestamp_by_id_transaksi_ovo(self, request, id_transaksi):
        timestamp = self.ovo_rpc.get_timestamp(id_transaksi)
        return json.dumps(timestamp)