from nameko.rpc import RpcProxy
from nameko.web.handlers import http
import json
import datetime 
from werkzeug.wrappers import Response
import requests

class GatewayService:
    name = 'gateway'

    # TRANSAKSI PEMBAYARAN
    TransP_rpc = RpcProxy('transaksi_pembayaran_service')

    # Get berdasarkan id_pesanan
    @http('GET', '/Tpembayaran/pesanan/<int:IDPesanan>')
    def get__byIDPesananTP(self, request, IDPesanan):
        exist = self.TransP_rpc.get_byIDPesanan(IDPesanan)
        if exist:
            return Response(json.dumps(exist), status=200, mimetype='application/json')
        else:
            return Response(json.dumps('No Transaction found with this ID'), status=404, mimetype='application/json')
        
    # Get berdasarkan id_transaksi
    @http('GET', '/Tpembayaran/transaksi/<int:IDTransaksi>')
    def get__byIDTransaksiTP(self, request, IDTransaksi):
        exist = self.TransP_rpc.get_byIDTransaksi(IDTransaksi)
        if exist:
            return Response(json.dumps(exist), status=200, mimetype='application/json')
        else:
            return Response(json.dumps('No Transaction found with this ID'), status=404, mimetype='application/json')
        
    # Update berdasarkan id_transaksi (jenis_pembayaran, nama_penyedia)
    @http('PUT', '/Tpembayaran/transaksi/<int:IDTransaksi>')
    def update__byIDTransaksiTP(self, request, IDTransaksi):
        exist = self.TransP_rpc.get_byIDTransaksi(IDTransaksi)
        if exist:
            try:
                data = json.loads(request.get_data(as_text=True))
                # timestamp = data.get('timestamp')
                jenis_pembayaran = data.get('jenis')
                nama_penyedia = data.get('nama_penyedia')
                status = data.get('status')
                update = self.TransP_rpc.update__byIDTransaksi(IDTransaksi, jenis_pembayaran, nama_penyedia, status)
                return Response(json.dumps(update), status=200, mimetype='application/json')
            except Exception as e:
                return 500, json.dumps({"error": str(e)})
        else:
            return Response(json.dumps('No Transaction found with this ID'), status=404, mimetype='application/json')
    
    #Create transaksi_pembayaran
    @http('POST', '/Tpembayaran')
    def create_pembayaranTP(self, request):
        data = json.loads(request.get_data(as_text=True))
        id_pesanan = data.get('id_pesanan')
        id_pesanan2 = data.get('id_pesanan2') 
        total_transaksi = data.get('total_transaksi')
        
        pembayaran = self.TransP_rpc.create_pembayaran(id_pesanan, id_pesanan2, total_transaksi)

        return pembayaran['code'],json.dumps(pembayaran['data'])
    
    #update status berdasarkan id_pesanan
    @http('PUT', '/Tpembayaran/pesanan/<int:id_pesanan>/status/<string:status>')
    def update_status_pembayaranTP(self, request, id_pesanan, status):
        transaksi = self.TransP_rpc.update_status_pembayaran(id_pesanan, status)
        if transaksi :
            return transaksi['code'],json.dumps(transaksi['data'])
        else:
            return transaksi['code'],json.dumps(transaksi['data'])
    
    #update id_transaksi berdasarkan id_pesanan
    @http('PUT', '/Tpembayaran/pesanan/<int:id_pesanan>/transaksi/<string:id_transaksi>')
    def update_idTransaksiTP(self, request, id_pesanan, id_transaksi):
        transaksi = self.TransP_rpc.update_idTransaksi(id_pesanan, id_transaksi)
        if transaksi :
            return transaksi['code'],json.dumps(transaksi['data'])
        else:
            return transaksi['code'],json.dumps(transaksi['data'])
    
    #update id_transaksi, jenis_pembayaran, nama_penyedia, status(ongoing), timestamp(otomatis) berdasarkan id_pesanan
    @http('PUT', '/Tpembayaran/pesanan/<int:id_pesanan>')
    def update_pembayaranTP(self, request, id_pesanan):
        data = json.loads(request.get_data(as_text=True))
        id_transaksi = data.get('id_transaksi')
        jenis_pembayaran = data.get('jenis_pembayaran') 
        nama_penyedia = data.get('nama_penyedia')
    
        transaksi = self.TransP_rpc.update_pembayaran(id_pesanan, id_transaksi, jenis_pembayaran, nama_penyedia)
        if transaksi :
            return transaksi['code'],json.dumps(transaksi['data'])
        else:
            return transaksi['code'],json.dumps(transaksi['data'])
    
    # NOTIFIKASI
    notif_rpc = RpcProxy('notif_service')

    #GET notif berdasarkan id_notif
    @http('GET', '/notif/<int:idNotif>')
    def get_notif_ID(self, request, idNotif):
        notif = self.notif_rpc.get_notif_ID(idNotif)
        # return json.dumps(notif)
        if notif:
            return Response(json.dumps(notif), status=200, mimetype='application/json')
        else:
            return Response(json.dumps('No Notification found with this ID'), status=404, mimetype='application/json')


    #GET semua notif
    @http('GET', '/notif')
    def get_rooms(self, request):
        notifs = self.notif_rpc.get_all_notif()
        return json.dumps(notifs)

    #GET notif berdasarkan id user
    @http('GET', '/notif/user/<int:idUser>')
    def get_notif_IDUser(self, request, idUser):
        notifs = self.notif_rpc.get_notif_IDUser(idUser)
        # return json.dumps(notifs)
        if notifs:
            return Response(json.dumps(notifs), status=200, mimetype='application/json')
        else:
            return Response(json.dumps('No Notification found with this User ID'), status=404, mimetype='application/json')
        
    #GET notif berdasarkan id user
    @http('GET', '/notif/user/<int:idUser>/<string:notifTypes>')
    def get_notif_IDUser_notifTypes(self, request, idUser, notifTypes):
        notifs = self.notif_rpc.get_notif_IDUser_notifType(idUser, notifTypes)
        # return json.dumps(notifs)
        if notifs:
            return Response(json.dumps(notifs), status=200, mimetype='application/json')
        else:
            return Response(json.dumps('No Notification found with this User ID'), status=404, mimetype='application/json')

    #PUT berdasarkan id_notif 
    # @http('PUT', '/notif/<int:idNotif>')
    # def update_notif_ID(self, request, idNotif):
    #     # data = json.loads(request.get_data(as_text=True))
    #     notif = self.notif_rpc.update_notif_ID(idNotif)
    #     return notif['code'],json.dumps(notif['data'])
    
    #Delete berdasarkan id_notif
    @http('DELETE', '/notif/<int:idNotif>')
    def delete_notif(self, request, idNotif):
        notif = self.notif_rpc.delete_notif(idNotif)
        return notif['code'],json.dumps(notif['data'])

    #GET notif berdasarkan status
    @http('GET', '/notif/status/<int:status>')
    def get_notif_status(self, request, status):
        notifs = self.notif_rpc.get_notif_status(status)
        return json.dumps(notifs)
    
    #GET notif berdasarkan tipe 
    @http('GET', '/notif/tipe/<string:tipe_notif>')
    def get_notif_type(self, request, tipe_notif):
        notifs = self.notif_rpc.get_notif_type(tipe_notif)
        return json.dumps(notifs)
    
    #GET notif berdasarkan judul
    @http('GET', '/notif/judul/<string:judul>')
    def get_notif_judul(self, request, judul):
        notifs = self.notif_rpc.get_notif_judul(judul)
        return json.dumps(notifs)
    
    # GET notif berdasarkan timestamp announce
    @http('GET', '/notif/timestampA/<string:timestamp>')
    def get_notif_timestampA(self, request, timestamp):
        notifs = self.notif_rpc.get_notif_timestampA(str(timestamp))  # Convert datetime to string
        return json.dumps(notifs)
    
    # GET notif berdasarkan timestamp masuk
    @http('GET', '/notif/timestampM/<string:timestamp>')
    def get_notif_timestampM(self, request, timestamp):
        notifs = self.notif_rpc.get_notif_timestampM(str(timestamp))  # Convert datetime to string
        return json.dumps(notifs)
    
    # create a new notification
    @http('POST', '/notif')
    def add_notif(self, request):
        try:
            data = json.loads(request.get_data(as_text=True))
            id_user = data.get('id_user')
            id_pesanan = data.get('id_pesanan')
            tipe_notif = data.get('tipe_notif')
            judul = data.get('judul')
            deskripsi = data.get('deskripsi')
            timestamp_masuk = data.get('timestamp_masuk')
            status = data.get('status')
            link = data.get('link')  # Use get() method to get optional fields
            
            # Call add_notif method with optional fields
            notif = self.notif_rpc.add_notif(
                id_user, id_pesanan, tipe_notif, judul, deskripsi, timestamp_masuk, status, link
            )
            return 200, json.dumps(notif)
        except Exception as e:
            return 500, json.dumps({"error": str(e)})
        

    
    @http('PUT', '/notif/<int:idNotif>')
    def update_notif_status(self,request, idNotif):
        notifs = self.notif_rpc.update_notif_status(idNotif)
        return json.dumps(notifs)
    
    @http('PUT', '/notif/link/<int:idNotif>')
    def update_notif_link(self,request, idNotif):
        notifs = self.notif_rpc.update_notif_link(idNotif)
        return json.dumps(notifs)
    
    @http('PUT', '/notif/pesanan/<int:id_pesanan>')
    def update_notif_link_pesanan(self,request, id_pesanan):
        data = json.loads(request.get_data(as_text=True))
        notifs = self.notif_rpc.update_notif_link_pesanan(id_pesanan, data['judul'])
        return json.dumps(notifs)
    