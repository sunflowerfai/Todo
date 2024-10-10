class TasksController < ApplicationController
  def index
    @tasks = Task.where(status: 'incomplete')  # โหลด tasks ที่ยังไม่เสร็จ
    @task = Task.new  # เพื่อสร้างแบบฟอร์มใหม่
  end

  def create
    @task = Task.new(task_params)
    @task.status = 'incomplete'  # ตั้งค่าสถานะเริ่มต้นเป็น 'incomplete'
    if @task.save
      redirect_to tasks_path  # กลับไปที่หน้ารายการ tasks
    else
      render :index  # ถ้ามีข้อผิดพลาดในการบันทึก ให้โหลดหน้า index อีกครั้ง
    end
  end

  def complete
    @task = Task.find(params[:id])
    if @task.update(status: 'complete')  # เปลี่ยนสถานะเป็น 'complete'
      redirect_to tasks_path
    else
      render :index
    end
  end

  private

  def task_params
    params.require(:task).permit(:description, :status)
  end
end
