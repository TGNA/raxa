class Admin::FileReaderController < ApplicationController
  layout "admin"
  before_action :authenticate_admin!
  
  def text
  end

  def text_process
    Product.delete_all
    ProductCategory.delete_all
    User.delete_all
    params[:text].split("\n").each do |line|
      type = line.split("#")[0]
      if type=="FAMILIAS"
        begin
          process_category(line)
        rescue
          redirect_to admin_text_url, :flash => { :error => "Error en el formato del archivo." }
          return
        end
      elsif type=="ARTICULOS"
        begin
          process_product(line)
        rescue
          redirect_to admin_text_url, :flash => { :error => "Error en el formato del archivo." }
          return
        end
      elsif  type=="CLIENTES"
        begin
          process_user(line)
        rescue
          redirect_to admin_text_url, :flash => { :error => "Error en el formato del archivo." }
          return
        end
      end
    end
    redirect_to admin_text_url
  end

  private
  def process_category(line)  
    c= line.split("#")
    category = ProductCategory.new
    category.s_id = c[1].to_i
    category.name = c[3]
    category.save!
  end

  def process_product(line) 
    c= line.split("#")
    product = Product.new
    product.ref_1 = c[1].to_i
    product.ref_2 = c[2].to_i
    product.description = c[3]
    product.cat_id = c[4].to_i
    product.iva = c[5].to_f
    product.recargo_eq = c[6].to_f
    product.ean = c[7].to_f
    product.unidad_caja = c[8].to_f 
    product.foto = c[9]
    product.tarifa_1 = c[10].to_f
    product.tarifa_2 = c[11].to_f
    product.tarifa_3 = c[12].to_f
    product.tarifa_4 = c[13].to_f
    product.tarifa_5 = c[14].to_f
    product.activo = !c[15].to_i.zero?
    product.descuento = c[16].to_i
    product.save!
  end

  def process_user(line)  
    c= line.split("#")
    user = User.new
    user.codigo_cliente = c[1].to_i
    user.email = c[2]
    user.password = c[3]
    user.nif = c[4]
    user.cliento_con_recargo = c[5] == "S"
    user.tarifa = c[6].to_i
    user.cd_ruta = c[7]
    user.email_vendedor = c[8]
    user.save!
  end
end