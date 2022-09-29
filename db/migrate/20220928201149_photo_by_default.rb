class PhotoByDefault < ActiveRecord::Migration[7.0]
  def change
    change_column_default(:users, :photo,
       from: nil, to: 'https://lanmo.unam.mx/repositorio/LANMO/rn/hablantes/imagenes/directorio/hablante_blank.png')
  end
end
