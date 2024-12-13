class ApplicationController < ActionController::API
   
        before_action :set_current_user_from_uuid
      
        private
      
        def set_current_user_from_uuid
          uuid = request.headers["falta_aqui_el_como_se_envia"] 
          if uuid.present?
            @current_user = User.find_by(uuid: uuid) 
          end
        end
      
        def current_user
          @current_user
        end
      
        def authenticate_with_uuid!
          unless @current_user
            render json: { error: "Usuario no autenticado o inválido" }, status: :unauthorized
          end
        end
 end
      
