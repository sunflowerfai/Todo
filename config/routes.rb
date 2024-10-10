Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # You can have the root of your site routed with "root"
  root 'tasks#index'  # เพิ่มเส้นทางนี้ถ้าคุณต้องการให้หน้าแรกของเว็บเป็นหน้ารายการงาน

  # Define routes for tasks
  resources :tasks do
    member do
      get 'complete', to: 'tasks#complete'  # เส้นทางสำหรับทำเครื่องหมายงานว่าเสร็จ
    end
  end
end
