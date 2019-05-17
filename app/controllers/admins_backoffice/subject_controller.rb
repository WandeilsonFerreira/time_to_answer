class subjectBackoffice::SubjectController < subjectBackofficeController
    before_action :set_subjects, only: [:edit, :update, :destroy]
    before_action :verify_password, only: [:update]

    def index
      @subjects = Subject.all.page params[:page]
    end

    def new
      subject = Subject.new
    end

    def edit
      @subject = Subject.find(params[:id])
    end

    def update
      if @subject.update(params_subjects)
        redirect_to subject_backoffice_subjects_path, notice: "Assunto/Área atualizado com sucesso!"
      else
        render :edit
      end
    end

    def create
      @subject = Subject.new(params_subjects)
        if @subject.save
          redirect_to subject_backoffice_subjects_path, notice: "Assunto/Área criado com sucesso!"
        else
      render :new
    end
  end


    def destroy
      if @subject.destroy
        redirect_to subject_backoffice_subjects_path, notice: "Assunto/Área excluído com sucesso!"
      else
        render :index
      end
    end


    private
      def params_subject
        params.require(:Subject).permit(:description)
      end

      def set_subjects
        @subject = Subject.find(params[:id])
      end

end
